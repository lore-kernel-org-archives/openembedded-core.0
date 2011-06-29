Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbzcG-0000aI-UV
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 20:36:01 +0200
Received: by pzk36 with SMTP id 36so1220220pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SwO3mnZOjEJ5fH0K8a6sBYrJ2cRnIgLXeLdMH0GPVrc=;
	b=VJB+iS2z/O0r3LzBI4kLof5L6SlRAsMOLG3npmQudx718nQ6ClfJKTDryMduXCQYhX
	PIOSBGfGesJd19Vz1Mkm+oFdNikZfZXq9OctcqmxnVsFBjPggHedI69l3lLeDpN3ZLeN
	oZ7i91C6GuKX5lwDLe4ZYoHMSrAQaWg9XDAYw=
Received: by 10.68.56.197 with SMTP id c5mr1596059pbq.441.1309372335437;
	Wed, 29 Jun 2011 11:32:15 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i9sm1089292pbk.4.2011.06.29.11.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 11:32:14 -0700 (PDT)
Date: Wed, 29 Jun 2011 11:32:26 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110629183226.GB15546@sakrah.homelinux.org>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<201106281207.23516.paul.eggleton@linux.intel.com>
	<4E0A794C.5060303@gmail.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C724@shsmsx502.ccr.corp.intel.com>
	<53FFBC7D-50F2-4307-B253-EAB8F86DFDAA@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6A167F0C726@shsmsx502.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C726@shsmsx502.ccr.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: 'Koen Kooi' <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Wed, 29 Jun 2011 18:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (30/06/11 00:44), Cui, Dexuan wrote:
> Koen Kooi wrote:
> > Op 29 jun 2011, om 18:14 heeft Cui, Dexuan het volgende geschreven:
> > 
> >> Khem Raj wrote:
> >>> On 06/28/2011 04:07 AM, Paul Eggleton wrote:
> >>>> On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
> >> BTW: meta and mete-yocto belong to the same git repo actually, so do
> >> you think showing them in one line like this 
> >> 
> >> meta,meta-yocto   = "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
> >> 
> >> is better than showing 2 lines like this:
> >> 
> >> meta             = "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
> >> meta-yocto    = "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
> > 
> > That breaks with repos like meta-intel and meta-oe. Maybe something
> Could you please explain a bit more?
> 
> > like this: 
> > 
> > METADATA_BRANCH             = "master"
> > METADATA_REVISION           =
> > "16f84804cfbe472833ff00bfd2694947eabf8e20" meta-angstrom             
> > = "master:fd68a073e9669fdee0a9dc0483b3d39d3e3e0b46" meta-oe          
> > = "master:8a12ecca32766ecdceb72cae76e93f8aadcf3669" meta-efl         
> > same 
> > meta-gpe                    	same
> > meta-gnome                 same
> > meta-texasinstruments       =
> > "master:2e16e2fbd93bc00bc0a0afaf86975da7778eaa43" meta-efikamx       
> > = "master:70cff8742d629fd32463e3ef1bddb83f04d08dc5" meta-nslu2       
> > = "master:aaf918b85d7a8155d6e7c0ff042808346998fbea" meta-htc         
> > = "master:f37d05ca7450f85642cea0e43a75df10663bd8f6" meta-nokia       
> > same 
> > meta-openmoko              same
> > meta-palm                   same
> > meta-zaurus                 same
> > meta-sugarbay               =
> > "master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db" meta-crownbay      
> > same 
> > meta-emenlow                same
> > meta-fishriver             same
> > meta-jasperforest           same
> > meta-n450                   same
> > meta-ettus                  =
> > "master:c34c30fa29f7ab484cc90efb9713325da8e01460" meta-openpandora   
> > = "master:edaf6e751f873ed7a82c1116d3d58b9a070052dc" meta-archos      
> > = "master:4b689944d968b0ef4d0e9928e76c54f8a76a919a" 
> I think the below is a better format(but the line may be too long?)?

You could list the layers line by line and then = "rev" after the last
layer from same repo

> meta,meta-yocto             = "master:16f84804cfbe472833ff00bfd2694947eabf8e20"
> meta-angstrom               = "master:fd68a073e9669fdee0a9dc0483b3d39d3e3e0b46"
> meta-oe,meta-efl,meta-gpe,meta-gnome = "master:8a12ecca32766ecdceb72cae76e93f8aadcf3669"
> meta-texasinstruments       = "master:2e16e2fbd93bc00bc0a0afaf86975da7778eaa43"
> meta-efikamx                = "master:70cff8742d629fd32463e3ef1bddb83f04d08dc5"
> meta-nslu2                  = "master:aaf918b85d7a8155d6e7c0ff042808346998fbea"
> meta-htc,meta-nokia,meta-openmoko,meta-palm,meta,zaurus  = "master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
> meta-sugarbay,meta-crownbay,meta-emenlow,meta-fishriver,meta-jasperforest,meta-n450, = "master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
> meta-ettus                  = "master:c34c30fa29f7ab484cc90efb9713325da8e01460"
> meta-openpandora            = "master:edaf6e751f873ed7a82c1116d3d58b9a070052dc"
> meta-archos                 = "master:4b689944d968b0ef4d0e9928e76c54f8a76a919a"
> 
> Thanks,
> -- Dexuan
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


