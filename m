Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QId47-00087v-3N
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 10:40:43 +0200
Received: by eye27 with SMTP id 27so1169304eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=63vqtu4uOk4Q6LFRxGmae3dLakP2jmwJNzWJYF52aoM=;
	b=XTm94LqBkg+wMG2kIC2RTG/Q/0c0o9blVsgdjtTsQRNhynAQ66s9NSZNt+5IAQTNcy
	0MrZAsFvahfClG/1fiT4F2zIALkrRr+I6h7h43KMrKGEuvapC1WwoUmfiW+XVB5hfmMD
	M9pck16OPVC8pINuf7arNyClxSJpspQXFpS1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=mr7JqgoqABpRWwyxT6Vs1fFyL/0LKSmwV9a8UfMSU4xg3szvpq6UVAIHTYvsG02L3o
	ElfW7qPIZkmmA5FvLLJ5Qc2O6BWqTI8QvKxTzay5xBLs93y3prPiNRucnGLgNHf/Ac3j
	MCmxNgAJG6waXbBTz01RWkDKRWSsoE0eSjyQs=
Received: by 10.14.15.20 with SMTP id e20mr2476760eee.16.1304757481447; Sat,
	07 May 2011 01:38:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Sat, 7 May 2011 01:37:30 -0700 (PDT)
In-Reply-To: <1304756644.30391.189.camel@rex>
References: <1304755709.30391.187.camel@rex>
	<BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
	<BANLkTi=J5nGBSUVMLSfbJo+RpsMk-OCU9g@mail.gmail.com>
	<1304756644.30391.189.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 May 2011 01:37:30 -0700
Message-ID: <BANLkTikVXbDNTE_Nt-ptxGjeQN5_RYcp-A@mail.gmail.com>
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
X-List-Received-Date: Sat, 07 May 2011 08:40:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 1:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-05-07 at 01:21 -0700, Khem Raj wrote:
>> On Sat, May 7, 2011 at 1:13 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Sat, May 7, 2011 at 1:08 AM, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >> Hi,
>> >>
>> >> It seems something on the server was broken and I'm unable to push to=
 the repository:
>> >>
>> >> $ git push origin master:master
>> >> Counting objects: 9, done.
>> >> Delta compression using up to 2 threads.
>> >> Compressing objects: 100% (5/5), done.
>> >> Writing objects: 100% (5/5), 490 bytes, done.
>> >> Total 5 (delta 4), reused 0 (delta 0)
>> >> remote: sed: can't read ./description: No such file or directory
>> >> remote: *** Project description file hasn't been set
>> >> remote: error: hook declined to update refs/heads/master
>> >> To ssh://git@git.openembedded.org/openembedded-core
>> >> =C2=A0! [remote rejected] master -> master (hook declined)
>> >> error: failed to push some refs to 'ssh://git@git.openembedded.org/op=
enembedded-core'
>> >>
>> >> Any ideas what's wrong?
>> >
>> > hmmm I added ml hooks but they are same as classic oe so it should
>> > have worked but let me see.
>>
>> OK I think I used wrong repo name probably that was it. Please retry
>> and see if it works
>
> No, still the same error :(

one more time. Now I have added description files.
>
> Richard
>
>


