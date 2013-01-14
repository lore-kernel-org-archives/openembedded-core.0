Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TugjW-00019x-LG
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 10:53:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0E9cE6k003330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Jan 2013 01:38:14 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 14 Jan 2013 01:38:13 -0800
Message-ID: <50F3D250.2060309@windriver.com>
Date: Mon, 14 Jan 2013 17:39:28 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130107113603.F0F381034A@opal> <20130107122949.GD3285@jama>
	<50F37555.9090604@windriver.com> <20130114081434.GA2992@jama>
In-Reply-To: <20130114081434.GA2992@jama>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r0E9cE6k003330
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Kang Kai : perl: update dependency creating script
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
X-List-Received-Date: Mon, 14 Jan 2013 09:53:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B401=E6=9C=8814=E6=97=A5 16:14, Martin Jansa wrote:
> On Mon, Jan 14, 2013 at 11:02:45AM +0800, Kang Kai wrote:
>> On 2013=E5=B9=B401=E6=9C=8807=E6=97=A5 20:29, Martin Jansa wrote:
>>> On Mon, Jan 07, 2013 at 11:36:03AM +0000, git@git.openembedded.org wr=
ote:
>>>> Module: openembedded-core.git
>>>> Branch: master
>>>> Commit: 35291c97edc05756788d206457c56dcc41edb637
>>>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dc=
ommit;h=3D35291c97edc05756788d206457c56dcc41edb637
>>>>
>>>> Author: Kang Kai<kai.kang@windriver.com>
>>>> Date:   Mon Nov  5 10:42:00 2012 +0800
>>>>
>>>> perl: update dependency creating script
>>>>
>>>> Base on dependency create script provided by Saul, I update it with:
>>>> 1 remove document strings in perl module files that may import fake
>>>>     dependencies.
>>>>
>>>> 2 not all the 'use' or 'require' clauses start at the begin of line,=
 and
>>>>     some of them don't end with ';', such as:
>>>>
>>>> use vars qw(
>>>>               $AUTOLOAD
>>>> 	    ...
>>>>
>>>> 3 filter some strings that they are not real dependencies: some of t=
hem
>>>>     are wrong result of script, some are conditional use/require, an=
d some
>>>>     are cpan extra modules that we don't need.
>>>>
>>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> This breaks parsing when
>>> http://patchwork.openembedded.org/patch/40997/
>>> is used.
>>>
>>> Parsing recipes...ERROR: There is a confusing multiline, partially co=
mmented expression on line 10 of file /OE/shr-core/openembedded-core/meta=
/recipes-devtools/perl/perl-rdepends_5.14.2.inc (| sed "s/\/.*\.pm: */ +=3D=
 /g;s/[\"\']//g;s/;.*/\"/g;s/+=3D .*\(require\|use\)\>   */+=3D \"perl-mo=
dule-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*/=
/g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] \).
>>> Please clarify whether this is all a comment or should be parsed.
>>> ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-de=
vtools/perl/perl_5.14.2.bb: Exited with "1"
>>> ERROR: Command execution failed: Exited with 1
>> Hi Jansa,
>>
>> Because my boy was born, I have been leaving office and missed this me=
ssage.
> np, congratz!

Thank you!

Regards,
Kai

>
> Cheers,
>
>>>> ---
>>>>
>>>>    .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2336 +++++++=
++++++++++++-
>>>>    1 files changed, 2287 insertions(+), 49 deletions(-)
>>>>
>>>> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3D=
commitdiff;h=3D35291c97edc05756788d206457c56dcc41edb637
>>>>
>>>> _______________________________________________
>>>> Openembedded-commits mailing list
>>>> Openembedded-commits@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-com=
mits



