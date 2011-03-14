Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzCru-0003gc-21
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 19:51:50 +0100
Received: by fxm19 with SMTP id 19so3148683fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=fYJ6hTSwwikbB8SQ09HA6M79WqGA7odbofP70c1AB8M=;
	b=HhqCjfJ6j3n1YrBHgMN03ZNTGLqoJ+Dg729aGNHxqdIHRJgVkF9jhTZYEwTRnWKvo+
	UNSPnoO5QTEPgbkuw3oF/oXWOzP9ZCAed2nlaromyVtuoga9pgXeYWBPl8/HrQy4iv1c
	AVF/kO8pGBEbEwt/4CdJfQABok6SDShgCAbJs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Dwzir0dhAgS2cudyH+ybhMtTO+7EXVrRrYbxZeMbjg/Uv077ne3nreL1ALJ2Jwmg7F
	ykyokY6oPf/cSFWOnr7s2BUN3/PjVDF5ialNgKwDOQpcPb/krcT93DsvvLnLgabZtbZJ
	03FIrFjlp5lRUwzpDtBjZO6LxzHF6P7fmS9wc=
Received: by 10.223.143.75 with SMTP id t11mr5985359fau.49.1300128217401; Mon,
	14 Mar 2011 11:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Mon, 14 Mar 2011 11:42:54 -0700 (PDT)
In-Reply-To: <1300125666.30423.354.camel@rex>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>
	<AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>
	<1299610396.602.104.camel@rex>
	<AANLkTim62_Vb=EumqASMY_ARCJkS8M7rTAUtpxnMR6gx@mail.gmail.com>
	<1299934200.1445.3023.camel@rex>
	<AANLkTimM2W1XiRcSJxrXYQDDRd2Hyxg3YAqq_kBVheWK@mail.gmail.com>
	<1300125666.30423.354.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2011 11:42:54 -0700
Message-ID: <AANLkTimHd5MrRoHT1LaUi=bKLbJdX0Xm026RhfDD0XOq@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Mon, 14 Mar 2011 18:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2011 at 11:01 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-03-14 at 10:52 -0700, Khem Raj wrote:
>> On Sat, Mar 12, 2011 at 4:50 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > If you look at the way the SDK toolchain works in Poky, it automatical=
ly
>> > ships the versions of these libraries that it needs so we don't actual=
ly
>> > have this problem.
>> >
>>
>> Yes thats one way of doing it and if you got it working this is fine
>> but there were issues when referencing
>> due to ORIGIN mucking. So this was better and cleaner than we link in
>> this libs into binary itself.
>
> The $ORIGIN stuff should be working just fine, have you checked this?
>
>> =C2=A0 From
>> my POV even this solution can be improved by adding the support libs
>> to gcc build itself as sources
>> then we dont need to muck with gcc build configury at all. I have been
>> doing that for non OE related
>> SDKs and has been best so far.
>
> As I mention above, I do think we have a solution for this which is
> working...


OK I think then I should withdraw this patch.


