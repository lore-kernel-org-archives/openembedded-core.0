Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UP856-0005Qx-K1
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 11:09:42 +0200
Message-ID: <51628545.6050106@communistcode.co.uk>
Date: Mon, 08 Apr 2013 09:52:21 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
In-Reply-To: <0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-initial Failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 09:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/13 18:03, Khem Raj wrote:
> On Apr 5, 2013, at 9:36 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
>> I build for the beaglebone and I changed them in line with your default beaglebone build patch you posted a week or so ago. I think it moved it form soft to hard float possibly...
> yes do a clean build if possible

Hi Khem,

Clean build results in the same failure.

Host GCC:

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.0/lto-wrapper
Target: x86_64-unknown-linux-gnu
Configured with: /build/src/gcc-4.8.0/configure --prefix=/usr 
--libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man 
--infodir=/usr/share/info --with-bugurl=https://bugs.archlinux.org/ 
--enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ --enable-shared 
--enable-threads=posix --with-system-zlib --enable-__cxa_atexit 
--disable-libunwind-exceptions --enable-clocale=gnu 
--disable-libstdcxx-pch --enable-gnu-unique-object 
--enable-linker-build-id --enable-cloog-backend=isl 
--disable-cloog-version-check --enable-lto --enable-gold 
--enable-ld=default --enable-plugin --with-plugin-ld=ld.gold 
--with-linker-hash-style=gnu --disable-install-libiberty 
--disable-multilib --disable-libssp --disable-werror 
--enable-checking=release
Thread model: posix
gcc version 4.8.0 (GCC)


Tune:

DEFAULTTUNE_beaglebone = "cortexa8hf-neon"

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



