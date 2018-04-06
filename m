Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAC160272;
	Fri,  6 Apr 2018 22:26:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36MPwLm001261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 23:26:00 +0100
Message-ID: <1523053558.2942.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Rifenbark <srifenbark@gmail.com>
Date: Fri, 06 Apr 2018 23:25:58 +0100
In-Reply-To: <CAFNP8Os_Zn-yLT_cZ7fQ8JLjOP8ERDSuA9YOsxQO7LJXDUb68g@mail.gmail.com>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<CAFNP8Os_Zn-yLT_cZ7fQ8JLjOP8ERDSuA9YOsxQO7LJXDUb68g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
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
X-List-Received-Date: Fri, 06 Apr 2018 22:26:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 11:16 -0700, Scott Rifenbark wrote:
> We have this variable appearing in a couple manuals BTW.  If anyone
> has any feedback on what is being said here I can update.

Some small suggested tweaks:

"Using the LAYERSERIES_COMPAT variable makes it clear when a given
layer is unmaintained and untested with new releases of OE-Core. "
->
"Using the LAYERSERIES_COMPAT variable allows the layer maintainer to
indicate which combinations of the layer and OE-Core may be expected to
work. It gives the system a way to detect when a layer has not been
tested with new releases of OE-Core, for example if it had become
unmaintained."

"The OpenEmbedded build system, however, does not produce an error if
the variable is not set."
->
"The OpenEmbedded build system will warn if the variable is not set for
any given layer"

Cheers,

Richard

