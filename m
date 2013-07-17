Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBF46B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 09:13:30 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 706D31840E9E;
	Wed, 17 Jul 2013 11:13:30 +0200 (CEST)
Message-ID: <51E66038.8000109@herbrechtsmeier.net>
Date: Wed, 17 Jul 2013 11:13:28 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1374050422-5056-1-git-send-email-net147@gmail.com>
In-Reply-To: <1374050422-5056-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake.bbclass: set ar/ld/nm/objcopy/objdump/ranlib/strip native paths
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
X-List-Received-Date: Wed, 17 Jul 2013 09:13:31 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.07.2013 10:40, schrieb Jonathan Liu:
> The CMAKE_{AR,LINKER,NM,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
> are currently set to values like CMAKE_LINKER-NOTFOUND for native
> recipes because the host paths are not searched. This is because the
> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM cmake variable is set to ONLY.
>
> To resolve this, explicitly set the variables using FIND_PROGRAM and
> pass the CMAKE_FIND_ROOT_PATH_BOTH option so the host paths are also
> searched.
Can you please debug the issue. Regarding my current check the variables 
are set in CMakeFindBinUtils.cmake and this is included by 
CMakeDetermineCCompiler.cmake. The later set _CMAKE_TOOLCHAIN_LOCATION 
based on the CMAKE_C_COMPILER variable and this is used as search 
location for the find_program calls. Can you check the value of 
_CMAKE_TOOLCHAIN_LOCATION?


