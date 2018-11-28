Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6896C63F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 11:21:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wASBLlGN015179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 28 Nov 2018 11:21:48 GMT
Message-ID: <ad97380e104a45fd7404b127ae37718a60ea169a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, ChenQi <Qi.Chen@windriver.com>
Date: Wed, 28 Nov 2018 11:21:47 +0000
In-Reply-To: <CAJTo0LaGc91uHa4gufXz6GKqdqUsW2oHfNHSaz2CjEVdLc-beQ@mail.gmail.com>
References: <cover.1543215301.git.Qi.Chen@windriver.com>
	<5e62cfa7835011994fbfbd9b0f1cfd22b0b53bf3.1543215301.git.Qi.Chen@windriver.com>
	<CAJTo0LaGc91uHa4gufXz6GKqdqUsW2oHfNHSaz2CjEVdLc-beQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Wed, 28 Nov 2018 11:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-11-28 at 10:26 +0000, Burton, Ross wrote:
> What if the hostname entry already exists? $sysconfdir instead of
> hard-coding etc.
> 
> I can't help but think a better solution would be to simply move
> /etc/hosts to base-files, so it can be updated at the same time as
> hostname.

I'm torn on this as netbase is a much better fit for the hosts file and
moving it would be a migration pain :(

Your other points stand though...

Cheers,

Richard


