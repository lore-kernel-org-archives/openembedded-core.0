Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdVoJ-0007Nl-PF
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 00:43:16 +0100
Received: from [192.168.2.10] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C399FA630E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 00:35:14 +0100 (CET)
Message-ID: <4EF26D31.9050209@eukrea.com>
Date: Thu, 22 Dec 2011 00:35:13 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EF1F39E.60903@jhksoftware.com> <jct88c$ajb$1@dough.gmane.org>
In-Reply-To: <jct88c$ajb$1@dough.gmane.org>
Subject: Re: meta-toolchain-qte and wrong paths to QT tools
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
X-List-Received-Date: Wed, 21 Dec 2011 23:43:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Le 21/12/2011 19:22, Dmitry Eremin-Solenikov a =E9crit :
> On 12/21/2011 06:56 PM, Juraj Hercek wrote:
>> Hello list,
>>
>> I've two questions:
>>
>> 1) When I build meta-toolchain-qte (c2de8d4 metadata revision) and
>> install the resulting sdk, I see two directories in /usr/local/:
>> oecore-i686-arm and oecore-i686-i686. What is a rationale behind havin=
g
>> these two directories instead of one i.e.: oecore-i686-arm?
>
> Because oecore-i686-i686 holds files that are created on i686 to be use=
d on
> i686. They will be common for arm meta-toolchain-qte, mips meta-toolcha=
in-qte,
> powerpc meta-toolchain-qte, etc.
>
>> 2) The oecore-i686-arm/environment-setup-armv5te-oe-linux-gnueabi scri=
pt
>> sets paths to the QT tools which should be installed in oecore-i686-ar=
m
>> directory, but they are not. These tools are installed under
>> oecore-i686-i686 directory. Changing the path in
>> environment-setup-armv5te-oe-linux-gnueabi after toolchain installatio=
n
>> is easy, but I do not consider it to be a correct fix (assuming that
>> oecore-i686-{arm,i686} directories represents proper toolchain
>> structure). What is a proper fix for this issue?
>
> I have the attached patch in my patch queue. Hope this helps.
>
there seems to be something wrong here :

-    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s=20
${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
+    (cd ${SDK_NATIVE_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s=20
${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)


${SDK_NATIVE_OUTPUT} seems undefined.

Eric


