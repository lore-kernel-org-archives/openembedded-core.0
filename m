Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-14.smtp.antispamcloud.com (mx6-14.smtp.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id 791CF7700E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 11:50:07 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Zj4HL-00072E-TL; Mon, 05 Oct 2015 13:50:07 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 5 Oct 2015 13:48:37 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <56124413.7020901@topic.nl>
	<1444040307.5118.13.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <561263C5.2050606@topic.nl>
Date: Mon, 5 Oct 2015 13:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1444040307.5118.13.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0mvayrARxQsaVhW6R5/2thqbscANip7ZwTyX91RPNepXTxYO9+h4+Kgr/VqvR5kS1nT
	JCAz68Bp5Nzs1GLNXgZmraJGWVbN0zdCh+St1How76M88A/FMgbf0S+ThhoMitkj8yvQGyRT2EBh
	ndiab5jvtWM5d+RkRXA/IaA9U5ie0KaxwrgLl8dH+3AxZLHmGJh+64tqI1v34cD3K2ZC34AYyBDs
	CGVQWjIY1+wA/g3TOcE5pDPR2nxU6DRRSGtNFtezYqxGMqsKjARq8PBC4qg7sLBrShfGp4EU0fbo
	qhhOIvH2lPPHVNWXnkQ7ilsl/36m+UeFXprlCOm3BAEbJtAcDD/sssj+FwWEyCWpBXdJ6Vkh5Qbj
	nuYeddfovBvutRuK7R6H57ct58uzcYYv7W/KknLmkljuMMLsWJ3maWWze/Ls0fU8FArYrRMJBumI
	Njn9+eCHJ3AcQe7onCBsCZOJ+cv73CChOPjKA0/DVd83+ELfnXyprHiD0GLOK2LqWxX85/pGRMZi
	MCNSygwAMg8WArZ9cfx8JEUvIQRTnKBcOAOubz+SEHcSBTM4j91TeTXUjLjYWQt1/5xnQymMoPtz
	HDeqqFz43py4SDhdaHkWcCH4Qi+O2Q8nN7beePg9XwrQaVKrqzAIoxpbUfRi1NzLbJnl5XsXMIep
	vRJ+N1Z0io/i75gmwcW7nLDlw5j1yg==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJXhXyDRoOQM5J3kcUr0HrMvJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why my do_compile depends on $MACHINE
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
X-List-Received-Date: Mon, 05 Oct 2015 11:50:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05-10-15 12:18, Richard Purdie wrote:
> On Mon, 2015-10-05 at 11:34 +0200, Mike Looijmans wrote:
>> =EF=BB=BFI've been puzzling with this for many hours now, but I can't se=
em to figure
>> this out.
>>
>> I have a recipe that doesn't mention MACHINE anywhere, but still the
>> sstate-cache won't be re-used for other machines, because OE somehow ins=
ists
>> the package does depend on $MACHINE.
>>
>> The workaround I could find is to put something like this in the recipe:
>>
>> MACHINE[vardepvalue] =3D "any"
>>
>> (Similar stupid hacks like "vardepsexclude" will probably work too, but =
I'm
>> not interested in forcing this particular recipe, but I'm trying to figu=
re out
>> what makes bitbake think it matters)
>>
>> Since it builds for an FPGA type, the package has
>> PACKAGE_ARCH=3D"${FPGA_FAMILY}" set, and FGPA_FAMILY is set in local.con=
f.
>>
>>
>> When switching machines, "bitbake -S printdiff fpga-image-dyplo-test" re=
ports
>> that MACHINE changed and that is what caused sstate not beign reused. Bu=
t the
>> recipe does not use anything related to $MACHINE at all.
>>
>> Is there a way to make it tell me WHY it thinks that MACHINE is importan=
t to
>> the recipe?
>
> Very briefly (sorry travelling), find the task that you want to know
> more around and find the sigdata file in the stamps directory for it.
> Run "bitbake-diffsigs <sigdatafile>" and it will show you how the
> dependencies are calculated. You can compare two sigdata files using the
> same command, "bitbake-diffsigs <sigdatafile1> <sigdatafile2>".

Thanks, that reveiled the issue.

I was smart in local.conf and calculated the FPGA name from the MACHINE nam=
e.=20
That yields the same word, but somehow the dependency on the MACHINE variab=
le=20
is kept.

A simple fix is then to just use a ":=3D" assignment for FPGA_FAMILY so tha=
t the=20
link to MACHINE is lost, but that then results in another rebuild:

   List of dependencies for variable FPGA_FAMILY changed from=20
'set(['MACHINE'])' to 'set([])'
   Dependency on Variable MACHINE was removed


The FPGA packages take long to build (4 hours for just one is no exception,=
 on=20
an i7 machine) so preventing them to be rebuilt is really important here.

But having found the issue, I guess after a round of rebuilds, it'll go awa=
y now.


For the bigger picture:

If I have a recipe that says:

X =3D "x"

And I refactor it a bit to read:

Y =3D "x"
X =3D "${Y}"

What is the logic behind having to rebuild the package now? Why does the=20
'source' of the contents matter to the hash? It won't generate different=20
output, regardless whether X is 'calculated' or just 'constant'.


In particular, I've noticed this happening when switching between AUTOREV a=
nd=20
a fixed revision in a recipe.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






