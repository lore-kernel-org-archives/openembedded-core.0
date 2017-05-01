Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4B96010D;
	Mon,  1 May 2017 11:42:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v41BgNmu007776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 1 May 2017 12:42:24 +0100
Message-ID: <1493638943.23535.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 01 May 2017 12:42:23 +0100
In-Reply-To: <CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 01 May 2017 12:42:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 11:42:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-01 at 13:07 +0200, Nicolas Dechesne wrote:
> well, it's the same for me. In the 'view source' page, i can see
> this:
> 
> ==
> You do not have permission to edit this page, for the following
> reason:
> The action you have requested is limited to users in the group:
> Administrators.

Right, it is totally broken.

Someone has messed up the group access permissions, likely related to
spam protection. Right now it appears only the admins can change
anything. I could try and fix it but I should probably understand who
did what and why to cause this first.

Who has changed the group permissions recently?

Cheers,

Richard

