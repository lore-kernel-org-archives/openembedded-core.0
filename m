Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8147526E;
	Sat,  7 Apr 2018 14:14:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w37EDvMn026557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 7 Apr 2018 15:13:58 +0100
Message-ID: <1523110437.2942.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Rifenbark <srifenbark@gmail.com>
Date: Sat, 07 Apr 2018 15:13:57 +0100
In-Reply-To: <CAFNP8Our-du_NSFvX6Q-PXAtu5evWA--gwG8TU=mX-_BW9XJwA@mail.gmail.com>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<CAFNP8Os_Zn-yLT_cZ7fQ8JLjOP8ERDSuA9YOsxQO7LJXDUb68g@mail.gmail.com>
	<1523053558.2942.50.camel@linuxfoundation.org>
	<CAFNP8Our-du_NSFvX6Q-PXAtu5evWA--gwG8TU=mX-_BW9XJwA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Sat, 07 Apr 2018 14:14:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 15:44 -0700, Scott Rifenbark wrote:
> Thanks Richard....
> 
> https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-
> LAYERSERIES_COMPAT

Can you tweak:

"Lists the versions of the OpenEmbedded Core project"
->
"Lists the versions of OpenEmbedded-Core"

we would never say "OE-Core Project". Also:

"To specify the OE-Core projects"
->
"To specify the OE-Core versions" 

I'd go as far as to say any reference to "OE-Core project" in the
manual probably needs tweaking.

Cheers,

Richard

