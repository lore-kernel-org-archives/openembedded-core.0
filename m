Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 845F973071
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2GCZgnw002363; Thu, 16 Mar 2017 12:35:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CtkcGF8r5I0g; Thu, 16 Mar 2017 12:35:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2GCZZgh002329
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Mar 2017 12:35:37 GMT
Message-ID: <1489667735.13980.103.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 12:35:35 +0000
In-Reply-To: <alpine.LFD.2.20.1703160713080.22627@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703160713080.22627@uk63952.mitel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: any necessity for MACHINEOVERRIDES in mpc8315e-rdb.conf?
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
X-List-Received-Date: Thu, 16 Mar 2017 12:35:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-16 at 07:23 -0400, Robert P. J. Day wrote:
>   (yet more pedantry, but when i try to explain stuff like this to
> students, it's nice to know what i'm talking about.)
> 
>   i notice the following excerpts from YP's mpc8315e-rdb.conf:
> 
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE_mpc8315e-rdb = "MPC8315ERDB_config"
>   KERNEL_DEVICETREE = "mpc8315erdb.dtb"
> 
> what is the purpose (if any) for the "mpc8315e-rdb" override in the
> line:
> 
>   UBOOT_MACHINE_mpc8315e-rdb = "MPC8315ERDB_config"
>                ^^^^^^^^^^^^^
> 
> given that this is a machine config file for a specific target,
> "mpc8315e-rdb", wouldn't this suffice?
> 
>   UBOOT_MACHINE = "MPC8315ERDB_config"

I suspect this would be fine, yes.

Cheers,

Richard

