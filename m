Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D332A744F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 14:06:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9TE6Hln027118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Oct 2018 14:06:18 GMT
Message-ID: <a269addcbf4c8d57266756f896ed9276579bf691.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Hugues.Kamba@arm.com
Date: Mon, 29 Oct 2018 14:06:17 +0000
In-Reply-To: <CAJTo0LZUu0xXJx8Ob8zW67U-GccgQjwqzeF_9KJ5eMi4ipcm5Q@mail.gmail.com>
References: <20181023084931.5543-1-hugues.kamba@arm.com>
	<CAJTo0LZUu0xXJx8Ob8zW67U-GccgQjwqzeF_9KJ5eMi4ipcm5Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Mon, 29 Oct 2018 14:06:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-29 at 13:07 +0000, Burton, Ross wrote:
> If pyvenv is going to disappear, would it be neater to just put all
> the files into PN-venv and have that RPROVIDE python-pyven for now?

I also agree with this FWIW.

Cheers,

Richard


