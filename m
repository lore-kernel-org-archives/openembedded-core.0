Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SY1JR-0008La-9c
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 22:40:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4PKURsQ009174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 13:30:27 -0700 (PDT)
Received: from msp-dhcp37.wrs.com (172.25.34.37) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 25 May 2012 13:30:26 -0700
Message-ID: <4FBFEBE2.9080905@windriver.com>
Date: Fri, 25 May 2012 15:30:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
In-Reply-To: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 May 2012 20:40:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/25/12 3:22 PM, Brandon Stafford wrote:
> Hi all,
>
> I'm trying to switch from OE classic to the new openembedded-core.
> Using the latest commit on the denzil branch, I've successfully made a
> meta layer and built a filesystem that looks reasonably similar to the
> old one. But, it seems like something has changed in the boot process.
>
> As the last step in initramfs/init.sh, after mounting the filesystem,
> the kernel would attempt to execute /sbin/init like this:
>
>      exec switch_root -c /dev/console /mnt/root /sbin/init
>
> With the same old kernel and my new filesystem, this occurs:
>
>      switch_root: can't execute '/sbin/init': No such file or directory
>
> When I look at the filesystem, /sbin/init is, of course, nowhere to be found.
>
> Has the boot process changed? What should I be doing instead of
> calling /sbin/init?

You should check your new rootfs.  is there anything called init on it, even in 
a different directory?  Are you using meta-oe and systemd?

You should have some type of an init in the new filesystem.. if not, then 
something is wrong with your image and you'll need to diagnose that first.

--Mark

> Cheers,
> Brandon
> --
> Brandon Stafford
> Rascal Micro: small computers for art and science
> Somerville, MA, USA
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



