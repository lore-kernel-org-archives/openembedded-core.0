Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 225F96007A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 11:05:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0FB5Se8025116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 15 Jan 2018 11:05:30 GMT
Message-ID: <1516014328.29722.227.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Paulo De Sousa Neves (Nokia - PL/Wroclaw)"
	<paulo.de_sousa_neves@nokia.com>, Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Jan 2018 11:05:28 +0000
In-Reply-To: <d7600f26-373a-7ca9-cbaa-97dfac3bd86d@nokia.com>
References: <1515779154-17898-1-git-send-email-ptsneves@gmail.com>
	<1515863693.29722.161.camel@linuxfoundation.org>
	<d7600f26-373a-7ca9-cbaa-97dfac3bd86d@nokia.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] Fix COMPATIBLE_MACHINE for -native recipe variants.
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
X-List-Received-Date: Mon, 15 Jan 2018 11:05:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-01-15 at 09:01 +0100, Paulo De Sousa Neves (Nokia -
PL/Wroclaw) wrote:
> Hello Richard,
> 
> My problem is that I have the PV expansion happens on the recipe, at 
> parsing time regardless of it being on the dependency chain or not.
> On 
> the other hand, the PV is not expanded if the COMPATIBLE_MACHINE is 
> honored. This makes my build significantly faster also, as it avoids 
> other expansions altogether.
> 
> Coming back to our issue, this means that with the
> COMPATIBLE_MACHINE 
> being honored, my recipes work for all cases except when they are in 
> native mode.

Native recipes should not be machine dependent so using
COMPATIBLE_MACHINE for this isn't an option.

The good news is its trivial to add your own anonymous python fragment
which does the same thing. Your layer will not pass the layer
compatibility tests should you do that though.

Cheers,

Richard

