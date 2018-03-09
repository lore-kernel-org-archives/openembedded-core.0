Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C770C71BB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 13:26:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w29DQnAM008643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 9 Mar 2018 13:26:53 GMT
Message-ID: <1520602008.10851.102.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>,
	openembedded-core@lists.openembedded.org, manjukum@xilinx.com
Date: Fri, 09 Mar 2018 05:26:48 -0800
In-Reply-To: <1520560178-31053-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
References: <1520560178-31053-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] own-mirrors.bbclass: Change prepend to append
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
X-List-Received-Date: Fri, 09 Mar 2018 13:26:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-03-08 at 17:49 -0800, Bhargava Sreekantappa Gayathri
wrote:
> If BB_NO_NETWORK is set to 1, and local download directory is added
> as
> PREMIRRORS_prepend in conf file, PREMIRRORS variable will have
> SOURCE_MIRROR_URL as the first url. This causes build to fail as
> network
> access is diabled. PREMIRRORS should be appended here so that a
> prepend
> in other layers/conf files takes precedence.
> 
> Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-
> gayathri@xilinx.com>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.c
> om>
> ---
>  meta/classes/own-mirrors.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I think this patch just moves the problem, you could easily have a
file:/// url as SOURCE_MIRROR_URL and a network address in your other
layer in which case your patch would break things...

Cheers,

Richard

