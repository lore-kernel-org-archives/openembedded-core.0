Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9A85877333
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 21:39:46 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so4753235pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=TwAsDrxiNk9XJs9XeTudjoREwUxYZR2MlrIp4KVHqoI=;
	b=PCOWeg2uCLIHFkgFxQBCqJHCwsfe7jLq3a29ojuK1XcbziHAVNEsIDFcNni39m3TBD
	HEP0/0CzPuvW3l06CEhal3v1GUWlkySr3UqhpaYmBYHZWtawbcJYdT0T8GoDcGDDlodF
	8VAQ/5Fv95Y4we9i/ylwIbTQUud9Z8l3FgVVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=TwAsDrxiNk9XJs9XeTudjoREwUxYZR2MlrIp4KVHqoI=;
	b=UxtCJir15Nxt79btFBPmhQ+CkBhRC6g5NvzW2XvJ+uROgoNAtdAvFiXM8Nvsh8VMxC
	+UTVNdN1iPg1MzbHZ3NBooTiQNk5RVOk2PJu4KFGpxBE8sgUhyyocWM+IKpf3W84hiZd
	sXGpJWwLtSVLzS/p/PDSYporUuvrqwdfdOu/c/6ijFXpFt5+rfnthk1XXL/aJMPbaEy3
	2f0YWv/ZE/gxBvn0XItP1otDOzso2kXdd3WYasss0Ua9qnGdjzB+uD8uNzYfjno43wqf
	PUIw3RIkIHL1SxOA1JwAlRMkO7+LuQOEq3D1FOoycDqpoycRjH7U2+T6LrjqJqjXYwj+
	OUOg==
X-Gm-Message-State: ALoCoQlcLh1twJOjjk1G/M5YTU9QSJeU7pHMNqJxeQdcgchx4GhEtrrniHPlZ/8UYnPcKR2LtvQl
X-Received: by 10.68.217.2 with SMTP id ou2mr34694350pbc.81.1447450786794;
	Fri, 13 Nov 2015 13:39:46 -0800 (PST)
Received: from [192.168.17.200] (50-39-160-18.bvtn.or.frontiernet.net.
	[50.39.160.18]) by smtp.gmail.com with ESMTPSA id
	at5sm15561956pbc.32.2015.11.13.13.39.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 13:39:45 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
From: Michael Halstead <michael@yoctoproject.org>
Openpgp: id=D1F2407285E571ED12A407A73373170601861969
X-Enigmail-Draft-Status: N1110
Message-ID: <564658A0.60609@yoctoproject.org>
Date: Fri, 13 Nov 2015 13:39:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 21:39:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

It seems git-notify was sending mail as "cia@cia.navi.cx" and that was
causing the mail server to get added to blacklists so it was disabled.
I've changed the script and re-enabled it for:

openembedded-core
meta-openembedded
OpenEmbedded (but I don't know if we need it)

Michael Halstead
Yocto Project / SysAdmin

On 11/13/2015 12:47 PM, Khem Raj wrote:
>> On Nov 13, 2015, at 3:59 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>>
>> On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
>>> It seems I missed some announcement. At first I thought I had been
>>> unsubscribed from the openembedded-commits mailing list (since I have=
n't
>>> received any emails on that list since about the end of September). S=
o I
>>> looked up http://lists.openembedded.org/pipermail/openembedded-commit=
s/
>>> and it seems to have gone quiet about that time too.
>> I've already asked Paul and Michael few times on IRC in last few weeks=
=2E
>>
>> I haven't received any reply from Michael, adding him to To, now.
>
> I see that git-notify hooks have been disabled explicitly for all repos=
 in update.secondary file. thats why the messages are not being
> sent. We can enable them but I would like to know the reason they were =
disabled in first place. Since we do not have this under some
> sort of revision history, I can not find information for them as well. =
So we need this info before we enable them back.
>
>>> I liked being able to watch the commits to see what was going in, and=
 to
>>> check if my patches were added (before sending "ping"s, without havin=
g
>>> to "git pull" and search). Is there a new workflow for seeing what's
>>> going in?
>> Yes, I find them useful too (e.g. to report issue with commit which wa=
s
>> recently merged) or in general to know that it's worth doing "git pull=
".
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



