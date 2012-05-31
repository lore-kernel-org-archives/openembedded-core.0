Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SaCqR-0002Fn-Sx
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 23:23:48 +0200
Received: by ghbf1 with SMTP id f1so1617057ghb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DU5mD7ktLF9XpGN5GasjGGan90ZcMCJqzfr0Ll0V8G4=;
	b=IMya0a2draCe2TlOus//vzomS0kOaA+llU76Iq/soQbVlQm6qN6+lvZkNhflNAys6d
	o2JumnZf++JZqQ6Nejwb1HyrX+sVnvhtuTM78pLKTxr/6ZSFAAcWP33+cPYpv/5ngWy/
	radghgmoukTt5sw+gyVTb0tJPlSZiSgrkMS+4PL3A03hWKNqWItGR2Jp7Rx4P37hCXF+
	SiVnqAiwqY/VjHAd+m1Yt1405uTwWtjhKfpOpSfNHHdpLa8d65FjQqIac+whO8hfwpak
	Op4qa69SUPRNqNdqgyrcRhib9uhB6M3BZarWVeLfnc1pxeF/jpjiDHqKeGud9/Q81m2F
	nBdw==
MIME-Version: 1.0
Received: by 10.50.100.169 with SMTP id ez9mr15201973igb.44.1338498806894;
	Thu, 31 May 2012 14:13:26 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Thu, 31 May 2012 14:13:26 -0700 (PDT)
In-Reply-To: <C20D3B8A-D5AF-46EE-BC26-5423752FE815@gmail.com>
References: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
	<CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
	<C20D3B8A-D5AF-46EE-BC26-5423752FE815@gmail.com>
Date: Thu, 31 May 2012 16:13:26 -0500
Message-ID: <CAAB-1ywzkrpx7yoxvZYj-ByCqsXvaATzngWDukZb98mayLfbnQ@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] Generating device tree for building linux-xilinx kernel
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
X-List-Received-Date: Thu, 31 May 2012 21:23:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yep that could be done, just need to dig on EDK to do it :)

On Thu, May 31, 2012 at 3:56 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi Adrian,
>
> On May 31, 2012, at 10:49 PM, Adrian Alonso wrote:
>
>> That's a second process that you need todo with xilinx EDK to export
>> and launch xilinx SDK
>> from there create a new device tree project which will parse the "mhs"
>> hardware descriptor file
>> and from there generate the device tree according to the hwd settings...
>
> Perhaps these steps could be automated by modifying the
> meta-xilinx/classes/xilinx-kernel.bbclass file, so that the EDK gets
> invoked from the command line to parse the mhs file and create the
> dts file?
>
> Best regards,
>
> Elvis Dowson



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com


