Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UO9Ez-0005ER-7Z
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 18:11:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r35FsXQd010912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2013 08:54:33 -0700 (PDT)
Received: from msp-dhcp58.wrs.com (172.25.34.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 5 Apr 2013 08:54:33 -0700
Message-ID: <515EF3B8.5080205@windriver.com>
Date: Fri, 5 Apr 2013 10:54:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
	<CALbNGRS4MTJny0yqf-oYx1S12O-ZETo4g9x+7BuRVh8pbuBW0g@mail.gmail.com>
In-Reply-To: <CALbNGRS4MTJny0yqf-oYx1S12O-ZETo4g9x+7BuRVh8pbuBW0g@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r35FsXQd010912
Subject: Re: experiences with images based on current layer heads
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
X-List-Received-Date: Fri, 05 Apr 2013 16:11:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

If you are unable to look into this yourself, can you please file a bug o=
n the=20
bugzilla.yoctoproject.org website?  This issue is likely to get more atte=
ntion=20
if there is an active bug with reproducer steps.  (What you have below ma=
y be=20
enough for someone who understands X and xfce to reproduce it, but I'm no=
t sure.)

(I've very lightly used X under oe-core master, but I've not done anythin=
g more=20
then xterms myself.)

It would of course be even better if you could figure out a proper test c=
ase to=20
reproduce this, but that's not required...

--Mark

On 4/4/13 5:29 PM, Andreas M=C3=BCller wrote:
> On Wed, Apr 3, 2013 at 4:02 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Hi,
>>
>> when migration of systemd to oe-core turned to unbuildable I decided
>> to freeze my images and stopped further tests. Now that many issues
>> were fixed and we are close to another release I built my standard
>> xfce-based image based on latest layer HEADs. With this I face some
>> issues which I would like to share:
>>
>> 1. X sessions crash with OOM. This is reproducible by opening
>> google-maps with midori and changing to satellite view. In
>> Xorg.0.log.old I see only
>>
>> | (EE)
>> | (EE) Backtrace:
>> | (EE)
>> | (EE) Segmentation fault at address 0x9
>> | (EE) BUG: triggered 'if (inSignalContext)'
>> | (EE) BUG: log.c:502 in LogVMessageVerb()
>> | (EE) Warning: attempting to log data in a signal unsafe manner while
>> in signal context.
>> | Please update to check inSignalContext and/or use
>> LogMessageVerbSigSafe() or ErrorFSigSafe().
>> | The offending log format message is:
>> |
>> | Fatal server error:
>> |
>> | (EE)
>> | (EE) Backtrace:
>> | (EE)
>>
> seems we are not alone [1]
>
> [1] http://www.raspberrypi.org/phpBB3/viewtopic.php?t=3D38568&p=3D32129=
8
>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



