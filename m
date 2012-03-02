Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3NTP-0001Wz-8R
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 09:04:19 +0100
Received: by pbbrp12 with SMTP id rp12so1579773pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 23:55:47 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.240.41 as permitted sender) client-ip=10.68.240.41; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.240.41 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.240.41])
	by 10.68.240.41 with SMTP id vx9mr12390379pbc.10.1330674947682
	(num_hops = 1); Thu, 01 Mar 2012 23:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xKjT+lD8XtAI3LWZKW9WzlF5VsS0agkczsKxwoXcCvQ=;
	b=fCqeesnpySgSV+8v5a+Og+xwyThi+PwmxAyuhCgTo5iA+T/bbTSY2WGOvietMm+KJZ
	BwjNxY+waE4Tf7xN1fQ8yf7zVFQ8BGUm8QQ+yy4nuq0/XWnmDC2sKT3ox4bEZHkxNmU2
	oiVdrQ8+z5SdLIz8USFeuQyAh1ePP37ha0UOcASAgelKW7DVqE+R2dQc8TMAzIri2ZFa
	O0iUG/Z9mpYzYVyUOFkxQ+4Vy5zcH88RLL/nsOmslpnTDHP/h2SMVxnrMZwq5My2dsHT
	Dz9yGRVA+uGxOep5n61883trt6/RtbxPLI2Vd//4uuvZQ8LMN9CixVW3i7EvCbXeuwuN
	Q2zw==
Received: by 10.68.240.41 with SMTP id vx9mr10256607pbc.10.1330674947502;
	Thu, 01 Mar 2012 23:55:47 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id d4sm4360119pbe.36.2012.03.01.23.55.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 23:55:45 -0800 (PST)
Date: Thu, 1 Mar 2012 23:55:37 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120302075537.GA1850@sakrah.homelinux.org>
References: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
	<4F4F4A20.9060406@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF33800103@MBX21.4emm.local>
	<20120302052348.GA15160@sakrah.homelinux.org>
	<840A81C1B782724A8EB52725BD519EFF338001B6@MBX21.4emm.local>
MIME-Version: 1.0
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF338001B6@MBX21.4emm.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gdk-pixbuf: Pick up ${NM} from	the	environment.
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
X-List-Received-Date: Fri, 02 Mar 2012 08:04:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> It is more than set in the environment - the configure script spits out two messages about it before hitting this macro.
> So, I think the check is entirely extraneous.
> 

if you can point that there is another check which makes this one
redundant thats a different issue and then your patch is ok. but I doubt
thats the case

> I have seen this issue patched out in other gnome packages, some in oe-core.
> At least one was marked Upstream-Status: Inappropriate [configuration], and one marked Pending.
> So I got the idea that upstream was not interested...

usually such patches are taken status may be too conservative

> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


