Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id C992F74825
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 17:27:31 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id r9-v6so39389141iod.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sUPY+DdFK/lP7spCazgLfQPStl7WUTRIeeVChVKH5+4=;
	b=k1T6N/5+ie1o48+FB9m3H6Gm9Muex1v3jh0iBlDixwuo3DqSI2eXmHrvwjPa+5g9nZ
	mM2Y+nwfvueLI0IZZgWw41Fl1UwsilSAVFnD+ASCw4XDmSte030XQl7YrqJouAfoaFrM
	bMCvWdULVT7EwxMfAnS1ye7z3IbHIJiqTersMcbECbZunVco4wjAv7w333jYV8eAeWCv
	8sq/98xOsXG0brkWwoOdoqDMgEKdpWApGtbHCu7rB9e32Pq4g6aAXOnT0W2HMgGKH2A9
	zU52UXBSZkrLymIdTF/F60AXeTvCmP65jrjjRokAmc8i4vLigr9PUJ9GglC5dEvqvQoT
	wY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sUPY+DdFK/lP7spCazgLfQPStl7WUTRIeeVChVKH5+4=;
	b=VKx6hVG1KkAbOM/XGCciOhcfYPum0tm8Fz6zSUjlcDzKy772oZOic6qN8iQiSInAyQ
	1r6eG/bMcJL0VtDhl963Pza/GPfWCobQruKja/5mt4xZ4vK/XkgljmNY+qVoKtyvx/M/
	eGTwTNlUs0Tsvvif1IACaQ6Jynw07K/Yrn4lQNTz+rX4lP8k8EW7QV2RrfzWfPmJB2wq
	Ae1cJgxZstT0XOlVjj28bIMjUX7QOovQcV4r9n3enpjW8e02S9PDBr+Blgl8fiaFs/WT
	ekxFMKNU5rMkoZXEuyVTsX9Mos3BcKGpoUqls993ysL8PJEtHEhavOUxbMzTLNcJUi9g
	NEmQ==
X-Gm-Message-State: ALQs6tASXbanML5vKJcmEfA0mYFC4KQcUnpbNWShaLhV8f0oBhPFtLpg
	SFG56PFhtaNjWEuMaZ4oiTA=
X-Google-Smtp-Source: AB8JxZqHDDvTSuhVPSg0RH4Rf5wsPWxN/enG3JVaYrFZLQ1PwLfrlZpLuY5FW0JzfdD9P7Z5a5EABw==
X-Received: by 2002:a6b:4606:: with SMTP id
	t6-v6mr45080102ioa.158.1525800452177; 
	Tue, 08 May 2018 10:27:32 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b34-v6sm5899243itd.4.2018.05.08.10.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 May 2018 10:27:31 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1525800450.1489.119.camel@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 08 May 2018 12:27:30 -0500
In-Reply-To: <20180508170155.GV3228@denix.org>
References: <cover.1524665116.git.Martin.Jansa@gmail.com>
	<1cf93aa21ed541e982ff0be611cdc25eb4568538.1524665117.git.Martin.Jansa@gmail.com>
	<20180508170155.GV3228@denix.org>
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH 1/2] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Tue, 08 May 2018 17:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-05-08 at 13:01 -0400, Denys Dmytriyenko wrote:
> I see this got merged/backported to rocko today.
> Now my builds are failing with this error during parsing of meta-
> openembedded:
> 
> 
> WARNING: /.../sources/meta-openembedded/meta-oe/recipes-
> multimedia/jack/jack_git.bb: Error during finalise of
> /.../sources/meta-openembedded/meta-oe/recipes-
> multimedia/jack/jack_git.bb
> WARNING: /.../sources/meta-openembedded/meta-oe/recipes-
> multimedia/jack/a2jmidid_8.bb: Exception during build_dependencies
> for waf_do_compile
> WARNING: /.../sources/meta-openembedded/meta-oe/recipes-
> multimedia/jack/a2jmidid_8.bb: Error during finalise of
> /.../sources/meta-openembedded/meta-oe/recipes-
> multimedia/jack/a2jmidid_8.bb
> ERROR: ExpansionError during parsing /.../sources/meta-
> openembedded/meta-oe/recipes-multimedia/jack/jack_git.bb
> Traceback (most recent call last):
> bb.data_smart.ExpansionError: Failure expanding variable
> waf_do_compile, expression was /.../build/tmp/work/armv7ahf-neon-
> linux-gnueabi/jack/1.9.10+gitAUTOINC+2d1d323505-r0/git/waf build
> ${@get_waf_parallel_make(d)} which triggered exception IndexError:
> pop from empty list

Hmm, interesting. I'm not sure it's related, it might be a bug in
get_waf_parallel_make(). Whats the value of ${PARALLEL_MAKE} in that
recipe?

> 
> 
> I remember we spent several week trying to fix it properly in master
> back 
> in February and coordinate fixes betweem meta-openembedded and oe-
> core. Is 
> anything else missing?
> 
> -- 
> Denys
> 
> 
> On Wed, Apr 25, 2018 at 02:07:13PM +0000, Martin Jansa wrote:
> > * this doesn't work correctly as discussed in:
> >   http://lists.openembedded.org/pipermail/openembedded-commits/2018
> > -January/218460.html
> > * some of the issues were fixed in master since then
> >   but not all, so revert it until it's completely resolved
> > 
> > This reverts commit eac21f981337bfaddb2d67161a1ff049158041ce.
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/waf.bbclass | 17 +----------------
> >  1 file changed, 1 insertion(+), 16 deletions(-)
> > 
> > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > index acbda278a2..c4698e910a 100644
> > --- a/meta/classes/waf.bbclass
> > +++ b/meta/classes/waf.bbclass
> > @@ -25,23 +25,8 @@ def get_waf_parallel_make(d):
> >  
> >      return ""
> >  
> > -python waf_preconfigure() {
> > -    from distutils.version import StrictVersion
> > -    srcsubdir = d.getVar('S')
> > -    wafbin = os.path.join(srcsubdir, 'waf')
> > -    status, result = oe.utils.getstatusoutput(wafbin + " --
> > version")
> > -    if status != 0:
> > -        bb.warn("Unable to execute waf --version, exit code %d.
> > Assuming waf version without bindir/libdir support." % status)
> > -        return
> > -    version = result.split()[1]
> > -    if StrictVersion(version) >= StrictVersion("1.8.7"):
> > -        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --
> > libdir=${libdir}")
> > -}
> > -
> > -do_configure[prefuncs] += "waf_preconfigure"
> > -
> >  waf_do_configure() {
> > -	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
> > ${EXTRA_OECONF}
> > +	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
> >  }
> >  
> >  waf_do_compile()  {
> > -- 
> > 2.17.0
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

