Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2nVb-0005xc-R8
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 17:35:40 +0100
Received: by gwb11 with SMTP id 11so80070gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tWQ0D6SS4pQXyA4K+KxrIcpr0AqWIi4XWluTAPHhQB8=;
	b=disj/E2d7ZNvluxUx59fS3toRFC4M3brGd7EW4HkHiirSqqAg2ok2bKJEy/EGtjxCq
	N9lJydQUQ9cM/ry2Bt60wNgcyGlp1Ry6BCFw+eMrE+IrW4VVnTgM/2qBULGj4XTJsKHM
	HBElvyOL5s1b5HkFsF5h/O1PzTUp/Rapxysow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XHOn5edW0GoEkXg+J/pLAcQXFWdgz6p+50bLTeJzHKGuYMJ7vgX2SqkOnc22IiqzNb
	vuo14bL+7tFoAqTFce30A4sy9nDXdZrhyu6tzhqmjy5lmg7uWYFtTtle2D3AQtOttjkU
	MAtYyc7CK/T4ij+LfrMtFT2yxpTjkLvQE3ihU=
Received: by 10.43.59.130 with SMTP id wo2mr13734585icb.88.1300984426452;
	Thu, 24 Mar 2011 09:33:46 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id jv9sm34367icb.13.2011.03.24.09.33.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 09:33:45 -0700 (PDT)
Date: Thu, 24 Mar 2011 09:34:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110324163410.GA12992@sakrah.homelinux.org>
References: <20110324034537.GA31158@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20110324034537.GA31158@sakrah.homelinux.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Parsing error when adding a python function in .inc file
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
X-List-Received-Date: Thu, 24 Mar 2011 16:35:40 -0000
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/11 20:45), Khem Raj wrote:
> Hi
> 
> I am facing a strange problem. I am trying to add a small python function to qemu.inc and bitbake keeps telling me this
> 
> NOTE: Out of date cache found, rebuilding...
> ERROR: Error parsing
> /home/kraj/work/newoe/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_git.bb:
> Failure expanding variable EXTRA_OECONF, expression was
> ${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls
> --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370
> which triggered exception NameError: name 'get_qemu_target_list' is not
> defined
> ERROR: Command execution failed: Exited with 1
> 
> 
> Now if I move this function into a separate file say qemu-targets.inc
> and require qemu-targets.inc inside qemu.inc then it works correctly
> 
> There is similar kind of code in gcc-common.inc which is used in
> different inc files in gcc. I tried to use the python function defined
> in gcc-common.inc in same gcc-common.inc file and it worked so I dont
> know why qemu.inc case is special.
> 
> Any insights ?

Forgot to attach the patch. Here it is this time

> 
> I have attached the patch which I am using
> 
> -- 
> -Khem



-- 
-Khem

--TB36FDmn/VVEgNH/--
