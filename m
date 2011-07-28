Received: from mail-gw0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmEkR-000693-Ur
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:46:48 +0200
Received: by gwb17 with SMTP id 17so1671980gwb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xaL1D0DjhagRR0OFpDVklmS5L3SIB9FtIaESV6ijhRw=;
	b=l4hvdKVaoniQOtj88QuW8N+G1DaNjMDbnSgLmAAuoMYQ7vvuWjebUh8QTIYe0B4Gu1
	4ojhlyb0+mF6+2JkL6Cwxy2U4MeMeZaYTtsXVB7FWnyu7dqDeeba5k2VsahJBXMDBDt0
	o0uIQKrMSn2y6G3Z/e/7Wz0Jkqyw1ivRYArEw=
Received: by 10.68.33.196 with SMTP id t4mr704078pbi.280.1311813752104;
	Wed, 27 Jul 2011 17:42:32 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm399935pbx.66.2011.07.27.17.42.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 17:42:31 -0700 (PDT)
Date: Wed, 27 Jul 2011 17:43:26 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110728004326.GA16204@sakrah.homelinux.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop>
	<4E30489A.100@windriver.com>
	<1311795061.3398.9.camel@lenovo.internal.reciva.com>
	<4E3079BA.30705@windriver.com>
	<1311801404.3398.16.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1311801404.3398.16.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Thu, 28 Jul 2011 00:46:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > 
> > It was my understanding that interwork was always enabled these days.  Does
> > interworking require a thumb compatible arm core?
> 
> Not for v5 and up, since the ARM-state BX instruction always exists
> (even if it isn't capable of switching to Thumb-state), and pop {pc}
> always changes state if necessary.  The combination of these two things
> means that interworking basically comes for free and there is no benefit
> to turning it off.
> 
> But for v4T, the only instruction which is capable of a state change is
> BX, and that instruction simply doesn't exist at all in the non-T v4
> architecture.  So, if you plan to run on a v4 core you must either build
> with interworking off, or (more commonly nowadays) use the --fix-v4bx
> linker option to convert BX back to MOV during final link.

We use --fix-v4bx in oe

-- 
-Khem


