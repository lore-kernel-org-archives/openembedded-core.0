Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAhTs-00023v-7l
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 14:55:48 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so382393vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 05:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=wQNCsRpFmuWT7b2yZEAZc5jSIAidWJNtTKDgxIPvpnA=;
	b=HAWXvA4LcJlo+ia2J0lS0+NaAJSrh7QOiII+GZDFxcl255FKVHzBZu9gv/o4beEnzj
	3Q1hj2yNp1yJzIoLv76YIaP2nzLZw0ZsOUOeTvXt0Hqn2ShQFCbqEX1xLbHmeGJX7+XR
	4WUgznXuM3OiOecXGYgZj8nkvT777kHaD7Smfi+r4IAyZ6pQdWUvCDWvvgNn0WPYxbvE
	bntfToz4LY5LEwOmbObumLluKlVwcx3cVl7U4aDAjI3uM7dfapF5TC4rn+ED9TKX9QQ6
	/HUQI01UL6aBV4NvttJlXWFvxRKWkjMX104y9/VtMWXmpE/1svn4kF3AR4sazgW0LhzA
	wIeg==
X-Received: by 10.220.149.81 with SMTP id s17mr881564vcv.31.1361972355261;
	Wed, 27 Feb 2013 05:39:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 05:38:55 -0800 (PST)
In-Reply-To: <512DF015.8070102@topic.nl>
References: <1361294595-2454-1-git-send-email-milo-software@users.sourceforge.net>
	<512DF015.8070102@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 13:38:55 +0000
Message-ID: <CAJTo0LaFaahOYy1AdqvoGUP5B+D1CcsqQu-bXBMgxwuu6eiKwQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQlDnP6uT9Xw3OBJ5DL/M5C1woHt5CuhwxdWS7Dqwh4IA1UWNKVM/JsIUeLfnlWRKDY/gWh6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] util-linux: Add package for libmount
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
X-List-Received-Date: Wed, 27 Feb 2013 13:55:55 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2013 11:37, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Is there any feedback on this patch yet?

Acked-By: Ross Burton <ross.burton@intel.com>

I've been using it to reduce dependencies pulled in by systemd.

Ross


