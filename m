Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S33SV-0005xZ-Rf
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 11:42:04 +0100
Received: by dald2 with SMTP id d2so686408dal.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 02:33:33 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.203.73 as permitted sender) client-ip=10.68.203.73; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.203.73 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.203.73])
	by 10.68.203.73 with SMTP id ko9mr597364pbc.130.1330598013611 (num_hops
	= 1); Thu, 01 Mar 2012 02:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=r+QJkE3uT3e/hJTrdl7oLka1f7IMNkmCs1lPSKrrxjo=;
	b=lHvsoeuaFzykomcH9GXAK+mdlpCrqi2aWNwU6w8Lj/5WcF1GpCPeaqjjFUUbvbXoVZ
	Ye50GiMBG+83846zw1y4N95fnEfjHCBinJLf6Td6K1i41EGnwEMTwRAjA4BoEhTbgr8R
	V3YsGdAYVK8kWDv5GaG4bUpPRtswgO1chaRRw=
Received: by 10.68.203.73 with SMTP id ko9mr504243pbc.130.1330598013344;
	Thu, 01 Mar 2012 02:33:33 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id m7sm1760600pba.30.2012.03.01.02.33.31
	(version=SSLv3 cipher=OTHER); Thu, 01 Mar 2012 02:33:32 -0800 (PST)
Message-ID: <4F4F5079.1050608@gmail.com>
Date: Thu, 01 Mar 2012 02:33:29 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
	<20120229084544.GH21882@ibawizard.net>
	<CAGDS+nnW6QBngHLVVn7AS=HU_DAdc6JQr9k=mrpu9mx=dLRLOQ@mail.gmail.com>
	<CAGDS+nnd_hZnxgX1JfKMksxmfREYjqEYFYN+Yhj=sgffUsCXNA@mail.gmail.com>
In-Reply-To: <CAGDS+nnd_hZnxgX1JfKMksxmfREYjqEYFYN+Yhj=sgffUsCXNA@mail.gmail.com>
Subject: Re: psuedo-native strangeness on 64 bit build machine
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
X-List-Received-Date: Thu, 01 Mar 2012 10:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/29/2012 07:12 AM, Steve Sakoman wrote:
> On Wed, Feb 29, 2012 at 6:22 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>> On Wed, Feb 29, 2012 at 12:45 AM, Petr Štetiar <ynezz@true.cz> wrote:
> 
>>> Now it's impossible to finish the build, the most noticeable failure is gcc,
>>> which fails for me in patching task due to the parallel build settings.
>>> Changing the parallel settings back to 1 helps here also.
>>
>> I just tried building gcc and can confirm that it fails for me on the
>> 64 bit build machine.
> 
> For me, a -c cleansstate gcc and then a rebuild resulted in a
> successful gcc build.  I did not need to turn off parallel builds.
> 

just add NO32LIBS = "1" to your local.conf

> Steve
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



