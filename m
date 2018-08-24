Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C272795C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 06:59:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7O6x55U005379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 24 Aug 2018 07:59:06 +0100
Message-ID: <5ce22b3590fbc1689b4750f54c30ea0adaece109.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2018 07:59:05 +0100
In-Reply-To: <620b38a380c4e52a34592784f48bb5b0212f5ba0.1535080661.git.Qi.Chen@windriver.com>
References: <cover.1535080661.git.Qi.Chen@windriver.com>
	<620b38a380c4e52a34592784f48bb5b0212f5ba0.1535080661.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] utils.bbclass: fix KeyError exception
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
X-List-Received-Date: Fri, 24 Aug 2018 06:59:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-24 at 11:46 +0800, Chen Qi wrote:
> The following statement was accidently removed. Add it back.
> 
>   values['ml'] = ['']
> 
> This patch fixes the following error.
> 
>   Exception: KeyError: 'ml'
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/utils.bbclass | 1 +
>  1 file changed, 1 insertion(+)

Thanks, it was quite nice to wake up and find someone had fixed the bug
 I'd accidentally introduced! :)

Cheers,

Richard

