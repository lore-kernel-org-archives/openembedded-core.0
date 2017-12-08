Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96E7D786C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 17:46:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vB8HkbwO011847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 8 Dec 2017 17:46:39 GMT
Message-ID: <1512755197.19417.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Dec 2017 17:46:37 +0000
In-Reply-To: <CAJTo0La3_94Rg1LXJ9N81Ss4yoFvm3b3unJ5xt6-wc4p4-BFyQ@mail.gmail.com>
References: <20171208164454.7802-1-ross.burton@intel.com>
	<CAJTo0La3_94Rg1LXJ9N81Ss4yoFvm3b3unJ5xt6-wc4p4-BFyQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] lrzsz: remove
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
X-List-Received-Date: Fri, 08 Dec 2017 17:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-12-08 at 17:05 +0000, Burton, Ross wrote:
> I've had people from the past

What are you suggesting? ;-)

>  suggest that this is still useful for deeply embedded environments
> where a serial line is the only form of communication, so I'm
> retracting this and will instead clean up dependencies so it doesn't
> end up in all images.

To be clear, if you have a device you're doing board bringup on and
serial works but network doesn't this does provide a useful way to get
files in/out. That isn't an entirely unknown situation for OE users. It
would also potentially allow us to improve the serial test runner used
by poky-tiny.

Cheers,

Richard

