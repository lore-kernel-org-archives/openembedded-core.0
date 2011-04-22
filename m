Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDQDC-0004Cq-Bh
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 01:56:34 +0200
Received: by ewy5 with SMTP id 5so275745ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 16:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=U5nNOCZFhOPEbaiXTvaXh1ARGFlJTysPNtvA12fDSLw=;
	b=bUpmqonFEE8z7CWeefSOx2WBOhWozpXiORyYb8d9uNcbh50MGB1Z60LHgmVn98I++S
	LBbd5hCO6gHGmbbX1BACmiFK3zjYP0vHfILawpCOZMAEW7+StBRYPFDuDoTS6L+o6QMw
	50/TSABfNtwOw9HwuV/zhCPaoncqmJnj9TABc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=TAylfXAWNO9C1TKWovhlnMW7G87NdlncrhKBAnGx2tQUrhBr4xZWP4i3N6831f+hj4
	PDuzLyRlm9doZIhg93R9IMTaOfgw+YR5+nm6+Biqz40xCuuxQyrhk6bmcSmt6dcSSqz0
	Yyac7/VOz/g7pu43C7m6xh/mlH6zYlmbQZ0hQ=
Received: by 10.14.133.141 with SMTP id q13mr547053eei.156.1303516449103; Fri,
	22 Apr 2011 16:54:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 16:53:39 -0700 (PDT)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE9451693F01@orsmsx504.amr.corp.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
	<BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE9451693F01@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 16:53:39 -0700
Message-ID: <BANLkTinZAnhpu1fheLmp5HWT218ysN0=vg@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 23:56:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 3:28 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>> > =C2=A0# cairo >=3D 1.8.8
>> > =C2=A0DEPENDS =3D "cairo"
>> > -PR =3D "ml0"
>> > +PR =3D "r1"
>>
>> any reason not to use mlX
>
> The r1 kind of notation makes it consistent with rest of the recipes.


It does, I was just curious about 'ml'
>
> Thanks,
> Nitin
>
>


