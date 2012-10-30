Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TT9Vx-0004qU-5i
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:57:45 +0100
Received: from [192.168.0.2] (host81-153-114-212.range81-153.btcentralplus.com
	[81.153.114.212]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id C0FF599A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 10:44:11 +0000 (GMT)
Message-ID: <508FAF7A.2070706@r-finger.com>
Date: Tue, 30 Oct 2012 10:44:10 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
	<CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
	<CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
	<CAJTo0LZcHi16POq8_bQpURnjLxvj7fy=9m_LX27+Nz_RADQT2w@mail.gmail.com>
	<CAK18fxFcMPNVPXy6QcFAKAUmgyF83fBAX_BdUS8nLG=f=KQgyw@mail.gmail.com>
In-Reply-To: <CAK18fxFcMPNVPXy6QcFAKAUmgyF83fBAX_BdUS8nLG=f=KQgyw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 10:57:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/12 10:31, Andrei Gherzan wrote:
>> gnome-common is some scripts and tools used at configure time, so
>> there isn't any linkage, so there isn't any GPLv3 in the images, so
>> there isn't a problem.
>>
>> The question is how do we express this?
>>
>>
> Should it be whitelisted?

The problem with whitelisting is that if the usage changes from the
assumptions the whitelisting was originally made on, this will not
automatically remove the whitelisting -- if whitlisting is the solution
here, it needs to be left to the Yocto users to do it locally based on
their own review of the situation.

I think to handle this scenario properly, you would need two sets of
license controls, one for 'build tools' and one for 'things that ship'.

Tomas


