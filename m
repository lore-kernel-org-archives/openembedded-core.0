Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcp1-0007tP-O8
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 10:25:07 +0200
Received: by eye27 with SMTP id 27so1167394eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=mpDoy3DtKauh5UJvdl50N5ZXmg10bFvIewKQrYvzyZs=;
	b=hOeZ0pATMjCll7gp3FLqO6tg823AmR/YgRx9AwCGOWXpNxHqpxy4IkwECrolExodPj
	q/rG2ojzcjG0jp0NWXM0N19CoJJzovumuSvhlpSLux4ctDzmG223jAVCmwxxhG+VgHrp
	vwLUIoM9//nCL7U64XZx9CrXUVUuNOLrCjL3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=rqSR8kr7T+M/ng6Badzd8ThcUARIKrZQfgPWpJO3d9RwvdLrztcEob+fAAwslXRMDO
	3t+lKQO0y/d84Mnd+5NqSe0bFVldyWf4e3GhoaECJH8ecRpNR+yw/M7Sl2pVkGe5amwW
	52VfVtAj5E7J4xp7Fwpyp7byghuZN7hX6m4o4=
Received: by 10.14.15.78 with SMTP id e54mr2364198eee.80.1304756546113; Sat,
	07 May 2011 01:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Sat, 7 May 2011 01:21:56 -0700 (PDT)
In-Reply-To: <BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
References: <1304755709.30391.187.camel@rex>
	<BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 May 2011 01:21:56 -0700
Message-ID: <BANLkTi=J5nGBSUVMLSfbJo+RpsMk-OCU9g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Unable to push to the repository?
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
X-List-Received-Date: Sat, 07 May 2011 08:25:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 1:13 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, May 7, 2011 at 1:08 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Hi,
>>
>> It seems something on the server was broken and I'm unable to push to th=
e repository:
>>
>> $ git push origin master:master
>> Counting objects: 9, done.
>> Delta compression using up to 2 threads.
>> Compressing objects: 100% (5/5), done.
>> Writing objects: 100% (5/5), 490 bytes, done.
>> Total 5 (delta 4), reused 0 (delta 0)
>> remote: sed: can't read ./description: No such file or directory
>> remote: *** Project description file hasn't been set
>> remote: error: hook declined to update refs/heads/master
>> To ssh://git@git.openembedded.org/openembedded-core
>> =C2=A0! [remote rejected] master -> master (hook declined)
>> error: failed to push some refs to 'ssh://git@git.openembedded.org/opene=
mbedded-core'
>>
>> Any ideas what's wrong?
>
> hmmm I added ml hooks but they are same as classic oe so it should
> have worked but let me see.

OK I think I used wrong repo name probably that was it. Please retry
and see if it works
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>


