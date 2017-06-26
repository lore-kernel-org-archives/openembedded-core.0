Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 495836FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 21:51:35 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id j200so1220383ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 14:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=EnUPzbC+tgZhXOyhVnVEOfDRZkUiwyxjPzKYwdC62qE=;
	b=D5S4hoM7OGeg9umPeiTLCftcEz/Fy+unXUIbsbkd6gIruxdV7Qv82N3Nudm6ATwQpt
	n8HFbTxFihDLvMcYyGBiCdplKHuRncaakz6iTdlEWoV8y/xdHP8iVhJ4DzGjHTc3GVIS
	/caOkxwzHaV2GtUonu8sAdp3+8NXVf//w0gPxeIwXxzpAkqTVrKAIXOeWviLZU2GBQnI
	2G4SF6dV6V99x6EEM0F8IqqPZQEjpvvyyjj+d/Goh09P1O21Vo/tGUJ+yGkaSc7nCJfn
	baCBjRfZeuHoJlpk4TMfmiDdANwgyTU7JNJUz1Io0eddnPGtt0POECChIeb+PyGi80XF
	OI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=EnUPzbC+tgZhXOyhVnVEOfDRZkUiwyxjPzKYwdC62qE=;
	b=bzar+GZyC5wxEmM0SOd61Vj+sE9JuB6+KigTQHPhDbSdAhsJdOIkasiBDo8F+feS+X
	mpXrAnPlMqzQrfS5kYB7mYH3/36aQJ1wSRjiCMxfGOTyaVZfB292FG8FGWWvW0poLwTQ
	DzcWaJHeWXkctdgnbmllG2maSxElyfuFtt8cL6kEM3LNyNjVtCaLcmA00FsovIzkQbZS
	jT9iPfNxXycv0/V08u1mg1a0WujRgUUmHLtIQX9HVFpi6YIYrMmk2zZ8eGh/FORG1Rju
	eZQlAsJBVUwK9SK+a9+yb64nW7QPNmIDtAicau7Py+SM4aL7BJgfmNj6dqOkyppVEkKB
	/Y7Q==
X-Gm-Message-State: AKS2vOxotepEe/OKLdQwGCADZoBrcZ9rw2IGtV9kaVbn0lfPMEMVIalB
	ltB12p5rGjp1eg==
X-Received: by 10.107.52.198 with SMTP id b189mr3288243ioa.65.1498513896559;
	Mon, 26 Jun 2017 14:51:36 -0700 (PDT)
Received: from mbedesk.sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.gmail.com with ESMTPSA id
	c204sm659491ioc.51.2017.06.26.14.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 14:51:36 -0700 (PDT)
Date: Mon, 26 Jun 2017 17:51:33 -0400
From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Message-ID: <20170626215132.GA11747@mbedesk.sonatest.net>
References: <1498502034-13181-1-git-send-email-maxime.roussinbelanger@gmail.com>
	<CAP9ODKp+-fKQSM97AcqDe5Tm9r256LFg_fgDdiuzCFnk5TB_Xw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp+-fKQSM97AcqDe5Tm9r256LFg_fgDdiuzCFnk5TB_Xw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Mon, 26 Jun 2017 21:51:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 26, 2017 at 04:41:34PM -0300, Otavio Salvador wrote:
> On Mon, Jun 26, 2017 at 3:33 PM, Maxime Roussin-Bélanger
> <maxime.roussinbelanger@gmail.com> wrote:
> > CMake does not define the `find_host_program` command we've
> > been using in the cross-compiling code path.  It was
> > provided by a widely used Android toolchain file.  For
> > compatibility, continue to use `find_host_program` if
> > available, but otherwise use just `find_program`.
> >
> > Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
> 
> It sounds fine to me; the backward compatibility is maintained and it
> fixes a real use-case so I see no reason to not apply EXCEPT:
> 
> - lack of Upstream-Status field
> - lack of upstream bug about the issue, ideally the proposed patch
> should be send to upstream so we can drop it in next releases
> 

I just got r/w access to the poky-contrib repository. Do I have to create
a pull-request/send-pull-request to get an upstream-status field? 

Can we ignore this email and just use the pull-request script instead?

If so, do I have to resend the same patch (V2 ?) to the same recipients?

If not, how do I get an upstream-status? I just pushed my branch to contrib
repository (mroussin/fix_cmake_find_cuda_not_android), does that mean pending?


> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

