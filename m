Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UeSRh-0000Ab-A2
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:56:22 +0200
Received: by mail-ve0-f177.google.com with SMTP id ox1so5685639veb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 08:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=TAKAhq3QlmalRoz/q7k60/XnkuQhmsF9obvSJ5Ot+6o=;
	b=gU+juq2iDYdXn63aDx26KnnVf8mc8icbOR7nI19x0NbIA/DrP2B4ellpnRxV7WmUwk
	tDAD8OA3wYbTWEo8FvOVzdOX49FsuBA666x0i/TXWT7Wc9eRTwuX9mfaf44/utj2YsS2
	lPHADGZjkDLI7DPEmVATf87rCi0UGIqfdlhMEfQn+WdC8R+Z8Xic9s79IorD5cBd53AQ
	su4sxSPjtNARhBCdoHfgwLbYLDV/v0IS2SF+4v9Hdrk1joBPSFHKeRZKVxP96+xYbMjN
	PPQUqO+cr9CxO3zNAKefswfsLafivTejearz7tZ8ogpeUunKz306DtivBjoOWRpCiAwe
	XflQ==
X-Received: by 10.52.69.200 with SMTP id g8mr11619337vdu.4.1369064280439; Mon,
	20 May 2013 08:38:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Mon, 20 May 2013 08:37:40 -0700 (PDT)
In-Reply-To: <CAMKF1soCeFEhBfdGJBiBwRGv+r+XiqD_MUJqz9eKjiYjh53rYw@mail.gmail.com>
References: <1369018801-23696-1-git-send-email-net147@gmail.com>
	<CAMKF1soCeFEhBfdGJBiBwRGv+r+XiqD_MUJqz9eKjiYjh53rYw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 May 2013 16:37:40 +0100
Message-ID: <CAJTo0LbG-QhymfkD7MyMuC1=x=UYARv9VDQmpQ-3UVKUK8tUXw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQlTkzdEkzwhDP/iGhaYtdSzYz/E3ykMqve5jvfR9Zjr+BfEHztuU7rdf33JJG3hqgQkoHhH
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] systemd: update to 204
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
X-List-Received-Date: Mon, 20 May 2013 15:56:22 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2013 16:32, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, May 19, 2013 at 8:00 PM, Jonathan Liu <net147@gmail.com> wrote:
>> Tested startup/shutdown and serial getty under QEMU x86.
>
> Thats not enough. It should be tested on all qemus before it gets pulled.

Agreed.  And please use -M so renames are easier to review.

Ross


