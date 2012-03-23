Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAy8q-0004m9-9p
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 07:38:28 +0100
Received: by yenm3 with SMTP id m3so2484749yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=xTttl9Tv2igFXKq1kDbGP5YsqFw/EXcvgRL7PP34LaA=;
	b=npn51fmaHMHBh1GRglhkFP3w+3p576AyJ3jpLDsq7qy9iU0DpnDKFS0+lctobkIh0e
	m8aSkPRRvNTbBskPEqjhVBWPWddm7UdGnNDKEjSuwBRi/oTe8oSUV4rUw7P1u7mohV08
	DAGrn3GquzTeQXTg/3VQZlKZImxmOvEHbVcP0Lot3ouVZFPk/XGhIzv7+1hfcrI7ey8o
	wMutfB5wKRYT2QAhbk/7oLJNDWY9xEmInmHiQyR2cRl92rsb9gvMYn8MDL4q0NF+azwB
	EqyfaKlpG5GHSxiBzfYKHvfPLJTezFhOaby6BepWwORuzG4EhmtVHODbOodIZU8pRskG
	m3mQ==
Received: by 10.68.211.135 with SMTP id nc7mr26359926pbc.113.1332484171680;
	Thu, 22 Mar 2012 23:29:31 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id r10sm5165481pbf.22.2012.03.22.23.29.29
	(version=SSLv3 cipher=OTHER); Thu, 22 Mar 2012 23:29:30 -0700 (PDT)
Message-ID: <4F6C1847.8090708@gmail.com>
Date: Thu, 22 Mar 2012 23:29:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
	<20120322223127.136698cf@eb-e6520>
In-Reply-To: <20120322223127.136698cf@eb-e6520>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Fri, 23 Mar 2012 06:38:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 03/22/2012 02:31 PM, Eric Bénard wrote:
> Hi Khem, Hi Nitin,
>
> Le Thu, 22 Mar 2012 12:16:44 -0700,
> Khem Raj<raj.khem@gmail.com>  a écrit :
>> On Thu, Mar 22, 2012 at 10:38 AM, Kamble, Nitin A
>> <nitin.a.kamble@intel.com>  wrote:
>>> Looks like we need this patch for the python recipe to generate debug modules:
>>> http://patch-tracker.debian.org/patch/series/view/python2.7/2.7.2-8/debug-build.diff
>>
>> yep thats the one. Apply it to python and rebuild python-native and
>> stage it then see if that helps. You might have to adjust the FILES
>> and PACKAGES to put the new files in right places.
>
> With this patch all the libraries (including libpython2.7) now have a _d
> suffix : is that what we really want ?
>
> Once that's hacked in the recipe so that do_compile works - in case
> someone has an idea - I get a failure during installation of
> python-nativesdk :
> build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/python-nativesdk-2.7.2-r1.9/image/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7/sysconfig.py :
> return os.path.join(get_path('platstdlib'), "config" + (sys.pydebug and
> "_d" or ""), "Makefile") | AttributeError: 'module' object has no
> attribute 'pydebug
>
> I checked on both debian&  fedora and they are using this patch only to
> generate debug packages, not for the standard package.
> Moreover, when I execute gdb on my PC (Fedora 16) it runs fine and I
> don't have readline_d.so installed in lib-dynload so it seems possible
> to get gdb to work with python without having debug symbols.
>
> Eric

when I launch gdb I end up with

Traceback (most recent call last):
   File "/usr/lib/python2.7/site.py", line 562, in <module>
     main()
   File "/usr/lib/python2.7/site.py", line 544, in main
     known_paths = addusersitepackages(known_paths)
   File "/usr/lib/python2.7/site.py", line 271, in addusersitepackages
     user_site = getusersitepackages()
   File "/usr/lib/python2.7/site.py", line 246, in getusersitepackages
     user_base = getuserbase() # this will also set USER_BASE
   File "/usr/lib/python2.7/site.py", line 236, in getuserbase
     USER_BASE = get_config_var('userbase')
   File "/usr/lib/python2.7/sysconfig.py", line 543, in get_config_var
     return get_config_vars().get(name)
   File "/usr/lib/python2.7/sysconfig.py", line 442, in get_config_vars
     _init_posix(_CONFIG_VARS)
   File "/usr/lib/python2.7/sysconfig.py", line 303, in _init_posix
     makefile = _get_makefile_filename()
   File "/usr/lib/python2.7/sysconfig.py", line 297, in 
_get_makefile_filename
     return 
os.path.join(get_path('platstdlib').replace("/usr/local","/usr",1), 
"config" + (sys.pydebug and "_d" or ""), "Makefile")
AttributeError: 'module' object has no attribute 'pydebug'



