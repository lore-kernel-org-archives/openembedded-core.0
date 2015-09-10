Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7733E73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 19:47:32 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so23191420qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=m6DMzbW8v22zk60wlYA5foP++1CAVYeNOR5g3Xrf0mc=;
	b=k7f/FbNCdjjqekwPBUM114svHuZY4Bil8bxSmcZFVfs/IWdVoLI+TWjveVoOuWcwTO
	aMViVvfmQfEniajweNJXmoGxqvH3C9bYVW2HuqR4GbFupSTIO8Sqcdi0T2OPRizxfJ4M
	hDu+fQnBxcPjrNkPWJA96vIbYfc2dWx6D4bvCb2wcB5Qs1TeXa6UUKpjAIO2T7O3i58x
	THfZU5/M+lCbxXFdZqi51tW1hOC26y1E2SZ1v24cOqc2Mt2tBCyiqmTwLu0b5DrFXNWo
	3ajE4fEo9ysGai/nT8H1bb+ttFGX7y85/wFkT5d0FCE1jPo+MXtqWRog5ppCuonMzv3M
	voBA==
X-Gm-Message-State: ALoCoQkgwRYTYb8ktO6pyvdrv3tYC/7cxU/fMxbrJiVFiNWtfwAqJWeCoH+/+/fBUTLx8UFtfGqi
X-Received: by 10.55.195.86 with SMTP id a83mr55968643qkj.72.1441914452124;
	Thu, 10 Sep 2015 12:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 12:47:12 -0700 (PDT)
In-Reply-To: <20150910194533.GF2387@jama>
References: <1441912203-27833-1-git-send-email-ross.burton@intel.com>
	<20150910193310.GE2387@jama>
	<CAJTo0LZcOLYi6_psehUKvtu-+LeRkPPHHQfQnn7BLLc3WMQ2bw@mail.gmail.com>
	<20150910194533.GF2387@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 20:47:12 +0100
Message-ID: <CAJTo0LaurQY3F760qESEUbw4KghgZvVSSyX6LvX=g=KVRfsM4g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: Fix Upstream-Status statements
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
X-List-Received-Date: Thu, 10 Sep 2015 19:47:33 -0000
Content-Type: multipart/alternative; boundary=001a1142b950b73e4a051f69def1

--001a1142b950b73e4a051f69def1
Content-Type: text/plain; charset=UTF-8

On 10 September 2015 at 20:45, Martin Jansa <martin.jansa@gmail.com> wrote:

> > Should have mentioned that.  There are two cases from memory, where I was
> > fixing a Upstream-Status by hand and looked at the git history to
> identify
> > who added the file.
>
> Don't you need their permission or confirmation before adding SOB?
>
> Otherwise it doesn't serve any purpose and git hook can add it
> automatically.


In these cases it was clear who the creator of the patch was, but I'll
remove those lines from the patch.

Ross

--001a1142b950b73e4a051f69def1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 September 2015 at 20:45, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&=
gt; Should have mentioned that.=C2=A0 There are two cases from memory, wher=
e I was<br>
&gt; fixing a Upstream-Status by hand and looked at the git history to iden=
tify<br>
&gt; who added the file.<br>
<br>
</span>Don&#39;t you need their permission or confirmation before adding SO=
B?<br>
<br>
Otherwise it doesn&#39;t serve any purpose and git hook can add it<br>
automatically.</blockquote></div></div><div><br></div>In these cases it was=
 clear who the creator of the patch was, but I&#39;ll remove those lines fr=
om the patch.<div><br><div class=3D"gmail_extra">Ross</div></div></div>

--001a1142b950b73e4a051f69def1--
