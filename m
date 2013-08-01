Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 826A96A39D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 06:30:45 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so1709852vbg.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 23:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=hqLyrdWxBmlOPCxmnHHxg73/IdH3vtAUZuFtexnWgmY=;
	b=YzV7B/H6TME/T3GdVUkbZn1KxJiB1w+fVByiD5ZMfdVbH2ZVRBfCQ+vWri34njw2h8
	0/XN7TCdwC2qNVB4zyFiNzm8O4axktyxxD2AvxxuUSdwq4T1u0O2NKylUxbslQMFDJ7P
	3EhnZGLL6XWdAIsA/gZKxiogn3BP3qUu4IHnnrgSpLBgI8PyySS8FSlWUc1Xexj51gWh
	N1durH7QNMv+bJYsvVSoh1JJ+XY8xYpCNUnVpzCgE+WIfwjnA+JtSiTUIzecBV46dX6v
	io7LZipygVeeI2Z4wQiSJOTRUY44tRTMUI5hhXB8zrbbERBqlloWVpa0B8OYCHj2DVCZ
	1HfA==
X-Received: by 10.58.219.232 with SMTP id pr8mr29894017vec.80.1375338645838;
	Wed, 31 Jul 2013 23:30:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 31 Jul 2013 23:30:25 -0700 (PDT)
In-Reply-To: <CAPhnLPDcJDAQF=_PiZ2A87unB=ZEOW5atSgHvhu=x1H9c0LmhA@mail.gmail.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
	<435e5b32a36fbc1e2eabda8d9ed1eff7273673c5.1375275560.git.laurentiu.palcu@intel.com>
	<51F990E4.3060505@linux.intel.com>
	<CAPhnLPDcJDAQF=_PiZ2A87unB=ZEOW5atSgHvhu=x1H9c0LmhA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 07:30:25 +0100
Message-ID: <CAJTo0LbxoCY20u1T-Z3Y2EFBOQfNW_jcf71E-QkLiK8qNzT9yA@mail.gmail.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
X-Gm-Message-State: ALoCoQlTX6YLLy7+BkEEYgkCGn2PhR0kqh44iRGFyWdKJ2J9FcR0TwB28kGI2hYId4mwT9utNE49
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] subversion: upgrade to 1.8.1
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
X-List-Received-Date: Thu, 01 Aug 2013 06:30:45 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 00:59, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> If we do update this I'd like to also get this backported to earlier
> and remove all older versions of subversion to keep from mixing and
> matching with svn.
>
> They made changes in 1.8 that requires an upgrade to the working copy
> of a checkout. Once upgraded I don't believe you can go back to an
> earlier version. If people try to utilize an svn 1.8 oe-core and an
> svn 1.7 oe-core, this could destroy the svn working copies in DL_DIR.
> Which would be bad for those of us who maintain source mirrors.

Again? Urgh.  Sounds like an excellent reason to not move to 1.8 as
this bit us one already.

Ross

