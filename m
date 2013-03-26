Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXk7-0000OE-Jo
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:33:08 +0100
Received: by mail-vc0-f169.google.com with SMTP id kw10so5850769vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ImMgbLxHIJPvc9MyTgzK6Agjaug7Dw3WLubT6XK/+xU=;
	b=fcfOhc0kbKufmTvpm3fPJDC+XsFoCWsL1hv2upqvd+M1GYMlvAnXfqsJWqW22zzPh8
	BA8IuwzaW7PwgKZi0D4BL5itqwMx81SHsLD1WBjDXKRHmo9dniiclxK5lnGE7ppIdsGL
	gwujbYBG5TygHP5J9PGUyIcjg2OPMxppJdVC44e+3Lsu6pFghIDWINN0sgj8FSszv3o/
	7MmsT1WePG/jdO2MnVLnLCzE09hub/3EnMwF19krlLpwzxzfUM8h9ST//OhD7ITqLevP
	gEHnDOAmHMejEHSL9a4eiWNHIVg5KMhs7fHys6V1RuGnwjZCsBw74XEp5nCoAOINh5A7
	KHLg==
X-Received: by 10.52.74.102 with SMTP id s6mr17068538vdv.28.1364318162602;
	Tue, 26 Mar 2013 10:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Tue, 26 Mar 2013 10:15:42 -0700 (PDT)
In-Reply-To: <5482882.4phbAeRO1n@helios>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<ab888a7abe849f3170d5386b577f8a92e8ff5385.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2013 17:15:42 +0000
Message-ID: <CAJTo0LbtjnRzd3dymbs=Dma=k8aKhYprPNOkzmqQUyU=1PiJMQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlqlx9J1k6VpKYY0FFET2TcfGh4Uh0RWPRknxseIIpvDmjG7UO7kImAwrlQ4FIjIc5+K5g5
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:33:09 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2013 17:12, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> This is a great feature, but I just looked at it and realised that the term
> "whitelist" isn't really correct - this is more of a blacklist.
>
> The question is does it matter? If so we should probably change it now before
> it becomes too hard to change...

A variable called WHITELIST that is actually a blacklist should be
changed asap before we make a release, imho.

Ross


