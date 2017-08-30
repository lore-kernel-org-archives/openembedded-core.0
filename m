Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 62C8C77FEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 10:15:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7UAEv3a029698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 30 Aug 2017 11:14:58 +0100
Message-ID: <1504088097.2175.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2017 11:14:57 +0100
In-Reply-To: <1504087827-35456-1-git-send-email-sona.sarmadi@enea.com>
References: <1504087827-35456-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 30 Aug 2017 11:14:58 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH][pyro] connman: Fix for CVE-2017-12865
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
X-List-Received-Date: Wed, 30 Aug 2017 10:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-30 at 12:10 +0200, Sona Sarmadi wrote:
> dnsproxy: Fix crash on malformed DNS response
> If the response query string is malformed, we might access memory
> pass the end of "name" variable in parse_response().
> 
> [YOCTO #11959]
> 
> (From OE-Core rev: fb3e30e45eea2042fdb0b667cbc2c79ae3f5a1a9)
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

Thanks, I merged this to pyro.

Cheers,

Richard

