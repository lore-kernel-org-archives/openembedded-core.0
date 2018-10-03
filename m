Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB5671C54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 11:25:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w93BPD93000942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 3 Oct 2018 12:25:14 +0100
Message-ID: <5a57b59fc05db0260d1257692161ebcd5443aa2f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Oct 2018 12:25:13 +0100
In-Reply-To: <8738d389-5361-272b-f329-63c6538bb9ed@taitradio.com>
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
	<c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
	<4f206827-9c6e-608a-409f-a66edcfcec2d@taitradio.com>
	<8738d389-5361-272b-f329-63c6538bb9ed@taitradio.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: glibc binary reproducibility
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
X-List-Received-Date: Wed, 03 Oct 2018 11:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I don't think your patch will fix all the cases sadly. I did find
another technique that works:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=21bc0c2fe6e9d2ae1d08d3de5f2a6d75d4ba108b

basically by injecting a STT_FILE entry into the underlying assembler
files, the linker then doesn't need to add its own.

The patch above fixes aarch64 but will need additions for the other
arches which break...

Khem: Any thoughts on this?

Cheers,

Richard

