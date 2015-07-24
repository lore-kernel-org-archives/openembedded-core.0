Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE2B761AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 17:22:02 +0000 (UTC)
Received: by qgii95 with SMTP id i95so13694501qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 10:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4NUAiYaLO+I6hPgsUD++eiyAJvF/LDKNCiiefZQgNYg=;
	b=GsVMdrgSlnmjQUcHaPqQOgrh5sYujchyE1A00UKHwQl1v7hlv22MriKBUBbwlbJtmJ
	j3bX+WUhvbhmmuEfrkdZ0M9H+jWuIh9QVuU6w6lIfJnUEbQ13ox1Rzfsv8DDmIRxoh0X
	0WqD8PVKL6g8g516KqbhVZC3j1Yebv8f3mItyWnB7oWDfwBeK1RVCXVg6RwALKxy8avm
	4jvwJ+whnO3fnnRSMZmZfOR0dmo1zzTBlPrjZj3t+8nE7lzMFQWUl1H2Xi/F5bdhV41m
	b0cjQKiivXyciHrDnkN+lqr9LObD05N5hzFpJDolZ8iaaxO/aod0AJ0TbYjPpPKW4kXx
	WsvA==
X-Gm-Message-State: ALoCoQlGYLfouToXET6v0VO5eWgvPEfrpgn+BjT4G9FcHxuTT5rjk98auestk4hVVqV4G8rHZWbY
X-Received: by 10.141.28.211 with SMTP id f202mr23422503qhe.93.1437758522548; 
	Fri, 24 Jul 2015 10:22:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Fri, 24 Jul 2015 10:21:43 -0700 (PDT)
In-Reply-To: <1437754668-23055-1-git-send-email-gary@mlbassoc.com>
References: <1437754668-23055-1-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jul 2015 18:21:43 +0100
Message-ID: <CAJTo0LbFfSnepJrettNocJaNZJhAy0H6OOpiHQf5LMJu5fAriA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Don't try to use python3 during configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2015 17:22:07 -0000
Content-Type: multipart/alternative; boundary=001a114218c6029900051ba23eaf

--001a114218c6029900051ba23eaf
Content-Type: text/plain; charset=UTF-8

On 24 July 2015 at 17:17, Gary Thomas <gary@mlbassoc.com> wrote:

> No need to try for python3 as python2.7+ will do fine.
>

I rewrote this message to explicitly mention the argparse thing for future
reference, but thanks for the quick patch.

Ross

--001a114218c6029900051ba23eaf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2015 at 17:17, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1mm" class=3D"a3s" style=
=3D"overflow:hidden">No need to try for python3 as python2.7+ will do fine.=
<br></div></blockquote></div><br>I rewrote this message to explicitly menti=
on the argparse thing for future reference, but thanks for the quick patch.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a114218c6029900051ba23eaf--
