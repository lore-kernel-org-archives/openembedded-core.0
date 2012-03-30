Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDkQ5-0008RD-5z
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:35:46 +0200
Received: by qcso7 with SMTP id o7so646631qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=am+1VeXd5qsjvt3KhbvBmtrC2jtufWzjfeaZDQX8pLs=;
	b=tkOrknrX9cTe75bbepvJ72tdjAOrlLPI5eFHC05eCTbhGXRcAcuK/apU5NNKuaVazy
	5VHo0pe3V4xMwy4HX8vgGMXTlZq5tAo2itnrRW1P+cUlqwnqWD5uCjUJCKR77K5Vj9So
	bo6Fr95xJfIjIf984H5vG4/fETSrHvlA0GvvQoFOQVtq/jZO06g/JROudP+xk38Fkz4h
	3j2TsiKuJ225gueNcdsDSfkEAAZhZMOUfzT0tD+pGRSbjS3WcqEy99cFCN9calO7TQu7
	NfK/jhdfBOETbRSVP2ngXBsfjqWcJHa4gP8uYdnLRc3xZJ5Jn329Od3idVCBvlGuGlgz
	QoqQ==
Received: by 10.224.205.130 with SMTP id fq2mr718914qab.53.1333146399396; Fri,
	30 Mar 2012 15:26:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 15:26:18 -0700 (PDT)
In-Reply-To: <4F763106.6080302@windriver.com>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
	<4F762DE1.5070006@windriver.com>
	<CABcZANmEdxCg+rh8utC4Qw+6K1oC=KKZvPY9M0CDvDCatSt4zg@mail.gmail.com>
	<4F763106.6080302@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 15:26:18 -0700
X-Google-Sender-Auth: zDobJ4ZzCemIGNKwhbyB65bqk_0
Message-ID: <CABcZANmPgHRmFtxYtNQH6h24_OuQc6F62bjfYMW4Qvmq-WXyww@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] One shared state reuse solution
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
X-List-Received-Date: Fri, 30 Mar 2012 22:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 3:17 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/30/12 5:09 PM, Chris Larson wrote:
>>
>> On Fri, Mar 30, 2012 at 3:04 PM, Mark Hatle<mark.hatle@windriver.com>
>> =C2=A0wrote:
>>>
>>>
>>> We've worked on a similar problem in the past. =C2=A0In specific cases =
we've
>>> added a checksum of the host's glibc to the mix. =C2=A0The problem we w=
ere
>>> solving was in glibc uprevs during the RHEL 4 world.. new APIs would
>>> arrive
>>> and things would break -- or workaround would break.
>>>
>>> Have you considered adding that to the mix in an attempt to help
>>> determine
>>> compatible host distributions?
>>
>>
>> It's been discussed in the past, but the problem is, as far as I know,
>> glibc isn't the only build host dependency we have. It's the most
>> visible, since glibc versioned symbols are the first place one
>> generally sees this sort of failure, but I think the safe bet is to
>> operate based upon the distro name/version, to avoid any potential
>> other compatibility issues with other host libraries that get linked
>> against. It'd be nice to ensure that glibc is the only dependency, at
>> which point that sort of approach would be more reliable, but I don't
>> think we're there yet (please correct me if I'm wrong here).
>
>
> It would be nice if the host libc was the only dependency. =C2=A0;)
>
> Have you run any type of scan on the host dependencies to see where we
> actually sit? =C2=A0I know a while back I ran a scan and was surprised at=
 how few
> host dependencies there was in a fairly standard oe-core build.

I haven't -- that's a very good idea though. In fact, I hate to admit
it, but I've never even run swabber before :) It's on the 'when I find
the time' list..
--=20
Christopher Larson


