Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSbOB-0003ML-7O
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:59:11 +0200
Received: by yhjj56 with SMTP id j56so2153839yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=biJJ+BYQVIEQw3QUtaVFDbF8PSGqs4QXPwuJLiOgxn8=;
	b=Zj95SJDzesGBdXAuVwCYLWCLFh+vdP3V/fjyK3h38wKolf6fpW6efaQuNGP0hgXLvN
	Q422VYY9qivyPfORtj43hiLpOfPTuyW7QCEYI5Z1OUuGRbgL5AlnrOy+riezfS+DwNM3
	dD+ltjYuQhUDb0iDs2oNdMCmYQ5XkGSQgiZSZeoF/kGjTeiR7+3m3Tfki42g7QkCNazV
	MecnaA9458UvWmZJKL2MZA61jUW4goP8ZrAp7w4/BOUsEMbJOJIWk4lVUJiDsaACxui/
	LzxZiqt7/ueDYgGcQ+STUryjdu2BMaysmeZmGPzRVDHSuT8h4Va3MsA/iRbLBf4iaDUn
	wJ2A==
MIME-Version: 1.0
Received: by 10.42.150.8 with SMTP id y8mr3123595icv.10.1336686556184; Thu, 10
	May 2012 14:49:16 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Thu, 10 May 2012 14:49:16 -0700 (PDT)
In-Reply-To: <4FAC3559.6080609@intel.com>
References: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
	<4FAC3559.6080609@intel.com>
Date: Fri, 11 May 2012 00:49:16 +0300
Message-ID: <CAF6bG8f21DjmQjGKmb1z4JQ8fvdguR6zGaPoGgsPW_HVDz516Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 21:59:11 -0000
Content-Type: text/plain; charset=UTF-8

On 11 May 2012 00:38, Scott Garman <scott.a.garman@intel.com> wrote:
>
> Hi Marko,
>
> As the maintainer of the expat recipe, I appreciate your submission. However
> I'm a bit wary of removing the autotools patch

 Not removed, but adjusted to apply over expat-2.1.0.

 However, part of the old patch was removal of libtool.m4 include from
configure.in, but new version leaves libtool handling to configure.in
as is.

 So...

 - have you build tested this
> change for all of our QEMU architectures? I think it may still be needed.

 I'll do that during next couple of days.


 - ML


