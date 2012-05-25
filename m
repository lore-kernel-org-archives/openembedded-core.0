Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SY2dR-00045K-JA
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 00:05:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4PLtBhg016775
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 14:55:11 -0700 (PDT)
Received: from msp-dhcp37.wrs.com (172.25.34.37) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 25 May 2012 14:55:11 -0700
Message-ID: <4FBFFFBE.5000907@windriver.com>
Date: Fri, 25 May 2012 16:55:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
	<4FBFEBE2.9080905@windriver.com>
	<CA+b4E8z15092kNF7r=yQiRncNKDnVDZqB5_YqAe_5YRn=kBFPQ@mail.gmail.com>
In-Reply-To: <CA+b4E8z15092kNF7r=yQiRncNKDnVDZqB5_YqAe_5YRn=kBFPQ@mail.gmail.com>
Subject: Re: /sbin/init not found in oe-core
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
X-List-Received-Date: Fri, 25 May 2012 22:05:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/25/12 3:52 PM, Brandon Stafford wrote:
> On Fri, May 25, 2012 at 4:30 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>
>>> >>  Has the boot process changed? What should I be doing instead of
>>> >>  calling /sbin/init?
>> >
>> >
>> >  You should check your new rootfs.  is there anything called init on it, even
>> >  in a different directory?
> So far as I can tell, there is no file named init in the filesystem.
>
>> >  Are you using meta-oe and systemd?
> meta-oe: yes
> systemd: only if it is enabled by default, so I don't think so. I can
> still see /etc/rc[0-5].d, so I think that means Sys V is still in
> place.

meta-oe may have systemd enabled by default, but I'm not sure.  I haven't used 
it recently enough to know for sure.

>> >
>> >  You should have some type of an init in the new filesystem.. if not, then
>> >  something is wrong with your image and you'll need to diagnose that first.
> Sounds like I have something amiss with my filesystem.
>
> Is there a way to tell which package previously generated /sbin/init,
> so I can see whether it has changed?

Usually busybox, or sysvinit are the packages that generate that binary.  You 
should be able to see if either was built.  Search the filesystem for systemd 
may tell you as well..

--Mark

> Regards,
> Brandon
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



