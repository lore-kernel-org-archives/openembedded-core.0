Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC7E6018C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 04:27:55 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z76so168785033iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 20:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=WAFA2EXDsNAQmd41YDL9UUGmYBc6MB+1SwB7On2lPOs=;
	b=S60s/aGud+QLyEwmKD+XYDC3M1JwKq+l68wLUho5we8ZPo9gLUG8fOxAgtLvKiPr8k
	kp07s5bBkdiqRpazoeD9O35KOEnjx0H0llX+CebUxCXutFaswyCZlwDErQOTROqd3/wh
	qw8n5NOmYYEZqSfsC+LRLOfUh3Q41cM3ZmVT3vUE6lfFjd/b05OqJvcto/fJHzexc4l/
	ySjd1uNaJaWqa6RRvU3PbXpT72y5wsPp/UvvjM55IOfuxk92YtgcnFOQpdut7TjJ7o6R
	kKeq1FfwawKcX0bi8A/p67tHIiR3D3ghEityRwk6ibpjxQRfIL6160vZjGnnzPfALmx6
	Ir8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WAFA2EXDsNAQmd41YDL9UUGmYBc6MB+1SwB7On2lPOs=;
	b=djSlC3qJ8/1qwx/DlH7n+5v0Woa8xvQoQEqMS3HBXbV+91guWljVRVPLw3SanfmlBb
	BUfCB6zYLNiZeHriWpLqVp6/K/BZ1JqiONcPr/1f1FTO2rAUwYpvhwLa4+6t8Wmw82H4
	L2hxOeB0N/M5fT/AnsQXa4XQuHaH7vQb27es/68/mmSwnICpPP3uDyzxgDCc9Bjzwi7x
	CT+gfPfMChihBCv84bMbCkM+GFGqbBrSgJzYvTXZpe45CxeZLA9jqwrOsz0RjpXdZDgS
	X0Dckf0H/tEgm4SD1cXiVQvyitaNIwHiazszWPxPmRAtQh77CZZ4p7CulFiYdn+Cxgpj
	LFMA==
X-Gm-Message-State: AD7BkJICG8Q+r9hsVCGJcA+Wr9ytsnQv5FDXE9ZGqhN9CXxdNZQTqN3625ec+xeYBW9SfA==
X-Received: by 10.107.167.80 with SMTP id q77mr16267226ioe.110.1457756876322; 
	Fri, 11 Mar 2016 20:27:56 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	i187sm4874139ioi.33.2016.03.11.20.27.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 20:27:55 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E39AD3.4000503@gmail.com>
Date: Fri, 11 Mar 2016 23:28:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 04:27:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/16 22:59, Khem Raj wrote:
>
>
> On Mar 12, 2016 9:50 AM, "Trevor Woerner" <twoerner@gmail.com 
> <mailto:twoerner@gmail.com>> wrote:
> >
> > Currently my build shows two "meta" repositories: one from meta-poky 
> and one
> > from openembedded-core. Have the code which prints the repositories into
> > metadata-revs show the parent directories when repositories with 
> multiple
> > sub-layers are used.
>
> Meta-poky is a leaf layer. So how is it offering conflicting meta layer ?
>

There's no conflict, I'm just trying to generate output the 
differentiates amongst leaf layers in its output.

Before:
     meta              = master:00d3fd571a8d261d065b43f5cf3076a381843984
     meta-oe           = master:a1e135a499998add7575682bf53db5e02e753580
     meta-gnome        = master:a1e135a499998add7575682bf53db5e02e753580
     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
     meta-linaro-toolchain = master:367f784b831938dc508b7d472342d2d0d6ed9769
     meta              = master:37b61b059031e3c272a929b834e12fd83f46598c
     meta-poky         = master:37b61b059031e3c272a929b834e12fd83f46598c

After:
     openembedded-core/meta = 
master:00d3fd571a8d261d065b43f5cf3076a381843984
     meta-openembedded/meta-oe = 
master:a1e135a499998add7575682bf53db5e02e753580
     meta-openembedded/meta-gnome = 
master:a1e135a499998add7575682bf53db5e02e753580
     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
     meta-linaro/meta-linaro-toolchain = 
master:367f784b831938dc508b7d472342d2d0d6ed9769
     meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
     meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c

So you see how it prints the parent layer for any leaf layers, which is 
more descriptive (and better?).





> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com 
> <mailto:twoerner@gmail.com>>
> > ---
> >  meta/classes/buildhistory.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/buildhistory.bbclass 
> b/meta/classes/buildhistory.bbclass
> > index fac7fed..b6b4324 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -616,7 +616,7 @@ def buildhistory_get_build_id(d):
> >  def buildhistory_get_metadata_revs(d):
> >      # We want an easily machine-readable format here, so 
> get_layers_branch_rev isn't quite what we want
> >      layers = (d.getVar("BBLAYERS", True) or "").split()
> > -    medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
> > +    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i, 
> d.getVar('BBLAYERS_FETCH_DIR', True)), \
> >          base_get_metadata_git_branch(i, None).strip(), \
> >          base_get_metadata_git_revision(i, None)) \
> >              for i in layers]
> > --
> > 2.7.0.rc3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


