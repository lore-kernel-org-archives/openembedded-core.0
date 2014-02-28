Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DED3D6BD75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 22:42:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1SMgQYo016208; Fri, 28 Feb 2014 22:42:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id usdDXkg7Ngww; Fri, 28 Feb 2014 22:42:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1SMgKws016204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 28 Feb 2014 22:42:22 GMT
Message-ID: <1393627333.20876.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 28 Feb 2014 22:42:13 +0000
In-Reply-To: <CADkTA4OEvrDPDPq3-cKsX+_gN_qgR_dEVJKPWvkM2bV1TW0NHQ@mail.gmail.com>
References: <1393597694-5843-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OEvrDPDPq3-cKsX+_gN_qgR_dEVJKPWvkM2bV1TW0NHQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: bump to v3.14-rc4
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
X-List-Received-Date: Fri, 28 Feb 2014 22:42:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-02-28 at 13:41 -0500, Bruce Ashfield wrote:
> FYI: Some extended testing with my image-core-kernel-dev image type
> has shown that lttng and perf have some build issues, so we are
> finding the issues that we wanted to with this -dev kernel :)

Yes, the autobuilder has shown up a raft of issues in that area.

http://autobuilder.yoctoproject.org/main/tgrid

the line starting 7a30f308b07... is pretty much all kernel related from
the dev kernel.

Cheers,

Richard


