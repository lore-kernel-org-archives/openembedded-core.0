Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2217377330
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 22:03:11 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so112250307pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 14:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=OHCX9TXX1+MfbojuHDBWgpDjj5TFSwAnk5QsCTgYuoM=;
	b=CnKLoApagBL8aBvRydhWYsYr+6cR9f7aDiVTVGOaezo1VuLouNYG1ANpfb3HAkkxAE
	2bmhIaQvJGgbHRNqxN/K/5JBMl5/q7YwpBC/Lo1E/PJhvW4bdtP/Ok24z/2AMwm/6sNr
	ZUvADw7CoXwzO0f45+Ru/EJmnXXkCXrf3oh9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to:content-type;
	bh=OHCX9TXX1+MfbojuHDBWgpDjj5TFSwAnk5QsCTgYuoM=;
	b=fchcltHrFarYR+ccQAF1qvTj1JG7CyLKFttN1DcEf64oSQdVssEV6wuWb3kr9yvqxL
	uNJaByw1GS9LGhI6QEdAoyFXKr2uVe/YkJbx9VmZ5ZGFS2HX9CmZBABnNdXgog/A5WO2
	AUUG+6Z/EvFClEu4m2X/eBhiPHsx9F+NA/ybx5hPW35HFy1qyRuDH4ijVdQy32eEqbpb
	r6HVoqY7HpUVYeYTVEkfe8PGm5Ve6bxd79rdTHFKqGpGqc/yPtHFoHzsZK8oPrlQQBaI
	fyp3drpGqmAiK8CYgcDZtSCOkP8Q2VaECl0MthnIwx/+dq2bMMFu3tGzhyIUOdDmtk6l
	Ht9g==
X-Gm-Message-State: ALoCoQkmHcz9OTP28OmZDsMc/ZmKTckuk86M8GW7C2VB0pS6k/pZjcpnSUUdqwilYGUbEXiW0iIN
X-Received: by 10.66.253.135 with SMTP id aa7mr35229869pad.14.1447452191496;
	Fri, 13 Nov 2015 14:03:11 -0800 (PST)
Received: from [192.168.17.200] (50-39-160-18.bvtn.or.frontiernet.net.
	[50.39.160.18]) by smtp.gmail.com with ESMTPSA id
	db8sm22304165pad.43.2015.11.13.14.03.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 14:03:10 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
	<447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
From: Michael Halstead <michael@yoctoproject.org>
Openpgp: id=D1F2407285E571ED12A407A73373170601861969
Message-ID: <56465E1B.8040900@yoctoproject.org>
Date: Fri, 13 Nov 2015 14:03:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Fri, 13 Nov 2015 22:03:14 -0000
X-Groupsio-MsgNum: 73431
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="pU6EuwaNeSuSUlA5DAbM2itX0sOXdpb5v"

--pU6EuwaNeSuSUlA5DAbM2itX0sOXdpb5v
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On 11/13/2015 01:50 PM, Khem Raj wrote:
>> On Nov 13, 2015, at 1:45 PM, Michael Halstead <michael@yoctoproject.or=
g> wrote:
>>
>> Bitbake is disabled with the note:
>>
>> # interferes with patchwork sice it sends emails after the patches are=

>> closed
>> # we could re-enable it if the mails went to someother ml may be
>> bitbake-commits
>>
>> This happens because it was mailing bitbake-devel@lists.openembedded.o=
rg
>>
>> We can mail openembedded-commits@lists.openembedded.org which would wo=
rk
>> fine. Or I can create a bitbake-commits@lists.openembedded.org. Which =
is
>> better?
> I think mailing to openembedded-commits@lists.openembedded.org might be=
 ok. with [bitbake] in message subject for filtering help.

I've altered the script to include [reponame] in the subject of all
e-mails and enabled for bitbake.


Michael Halstead
Yocto Project / SysAdmin


>
>> Michael Halstead
>> Yocto Project / SysAdmin
>>
>> On 11/13/2015 01:41 PM, Khem Raj wrote:
>>>> On Nov 13, 2015, at 1:39 PM, Michael Halstead <michael@yoctoproject.=
org> wrote:
>>>>
>>>> It seems git-notify was sending mail as "cia@cia.navi.cx" and that w=
as
>>>> causing the mail server to get added to blacklists so it was disable=
d.
>>>> I've changed the script and re-enabled it for:
>>>>
>>>> openembedded-core
>>>> meta-openembedded
>>>> OpenEmbedded (but I don't know if we need it)
>>> bitbake too plz.
>>>
>>>> Michael Halstead
>>>> Yocto Project / SysAdmin
>>>>
>>>> On 11/13/2015 12:47 PM, Khem Raj wrote:
>>>>>> On Nov 13, 2015, at 3:59 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>>>>>>
>>>>>> On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
>>>>>>> It seems I missed some announcement. At first I thought I had bee=
n
>>>>>>> unsubscribed from the openembedded-commits mailing list (since I =
haven't
>>>>>>> received any emails on that list since about the end of September=
). So I
>>>>>>> looked up http://lists.openembedded.org/pipermail/openembedded-co=
mmits/
>>>>>>> and it seems to have gone quiet about that time too.
>>>>>> I've already asked Paul and Michael few times on IRC in last few w=
eeks.
>>>>>>
>>>>>> I haven't received any reply from Michael, adding him to To, now.
>>>>> I see that git-notify hooks have been disabled explicitly for all r=
epos in update.secondary file. thats why the messages are not being
>>>>> sent. We can enable them but I would like to know the reason they w=
ere disabled in first place. Since we do not have this under some
>>>>> sort of revision history, I can not find information for them as we=
ll. So we need this info before we enable them back.
>>>>>
>>>>>>> I liked being able to watch the commits to see what was going in,=
 and to
>>>>>>> check if my patches were added (before sending "ping"s, without h=
aving
>>>>>>> to "git pull" and search). Is there a new workflow for seeing wha=
t's
>>>>>>> going in?
>>>>>> Yes, I find them useful too (e.g. to report issue with commit whic=
h was
>>>>>> recently merged) or in general to know that it's worth doing "git =
pull".
>>>>>>
>>>>>> --
>>>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>



--pU6EuwaNeSuSUlA5DAbM2itX0sOXdpb5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWRl4bAAoJEH9hAclg9EfIQ10H/2XIl2PQNj95/yvAqoTBTqeL
RDuzIFwNzRCKEJgYbxvBt2E3UmnyLPYXl4/aflSbqaF97z5vxcYlu1rPv4jYcVRP
eKZriUgqZalqaR/MuLb45ql6gGiluib5dSnx9CBygUwBxP1NbAbuCxoJOqbTUyT7
agRykJr3oJGfDb9NcMxA6V9s5K4WXBhR6Rx0ci6ee4ORP3yFL4cXzc4srt9aarVX
v7DNycv2R9bAHYd6bZIJ14w7DL7hxOFp028fFPYRD5ROA0cMKbHX49YLq7Hp+8aI
VeiSiI/EUk2RAGu7iKjkY25moCE9c9H6MvMEs2fG54ZStMNqJkMkJ74DRG5e4pE=
=cqGV
-----END PGP SIGNATURE-----

--pU6EuwaNeSuSUlA5DAbM2itX0sOXdpb5v--
