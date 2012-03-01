Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pcjegan@gmail.com>) id 1S324E-0004kv-2s
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 10:12:54 +0100
Received: by wera1 with SMTP id a1so196940wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 01:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of pcjegan@gmail.com designates
	10.216.137.147 as permitted sender) client-ip=10.216.137.147; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of pcjegan@gmail.com
	designates 10.216.137.147 as permitted sender)
	smtp.mail=pcjegan@gmail.com;
	dkim=pass header.i=pcjegan@gmail.com
Received: from mr.google.com ([10.216.137.147])
	by 10.216.137.147 with SMTP id y19mr2150229wei.5.1330592664784
	(num_hops = 1); Thu, 01 Mar 2012 01:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=wTdAgoWIWDTPWwB95ehNB7FWlRXquygRhbRv4ozo4V8=;
	b=Qy8WFz9qlSDpNh7pWXfTvY9AmgoC6qJZ3vcUrrsWqEt1V5u+BhYjWxyYCusoi/a4Uk
	UFyITHY6Dvs/lZOuz86/I9xvpjn4Vx27+ddvvS5tPpYPS7k1jRpSYqooeClJ8VkjKfJ5
	S27GbhKXhAJ6DvCxjQwS4qGZvI1nXryYJGD+E=
Received: by 10.216.137.147 with SMTP id y19mr1715132wei.5.1330592664641; Thu,
	01 Mar 2012 01:04:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.17.10 with HTTP; Thu, 1 Mar 2012 01:04:03 -0800 (PST)
From: Jegan Chandru <pcjegan@gmail.com>
Date: Thu, 1 Mar 2012 14:34:03 +0530
Message-ID: <CAAA4K6JS1szpRpSJXiYTHYPoea8sjPcz=x2kADtCyuP1uTOqqw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] insane.bbclass: fix elf.arch not matching
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
X-List-Received-Date: Thu, 01 Mar 2012 09:12:54 -0000
Content-Type: multipart/alternative; boundary=00504502caea1ddfc104ba2abfdb

--00504502caea1ddfc104ba2abfdb
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am trying to built a x86_64 bit target filesystem on a 64 bit
host(Ubuntu-11.10) using yocto poky framework.
I encountered the same problem while compiling the kernel for my target.

*WARNING: QA Issue: Architecture did not match (62 to 3) on
/work/x86_64_intel-linux/linux-yocto-3.0.4+git3+d05450e4aef02c1b7137398ab3a9f8f96da74f52_5+6b2c7d65b844e686eae7d5cccb9b638887afe28e-r2/packages-split/kernel-vmlinux/boot/vmlinux-3.0.4-yocto-standard-00054-g6b2c7d6
*

As you can see I am using linux-yocto kernel version 3.0.4. So can you
please shed some light on this issue.

Thanks,
JC

PS: This is my first post on OE mailing list. Please direct me if I went
wrong somewhere.

--00504502caea1ddfc104ba2abfdb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I am trying to built a x86_64 bit target filesystem =
on a 64 bit host(Ubuntu-11.10) using yocto poky framework.</div><div>I enco=
untered the same problem while compiling the kernel for my target.=A0</div>

<div><br></div><div><div><i>WARNING: QA Issue: Architecture did not match (=
62 to 3) on /work/x86_64_intel-linux/linux-yocto-3.0.4+git3+d05450e4aef02c1=
b7137398ab3a9f8f96da74f52_5+6b2c7d65b844e686eae7d5cccb9b638887afe28e-r2/pac=
kages-split/kernel-vmlinux/boot/vmlinux-3.0.4-yocto-standard-00054-g6b2c7d6=
</i></div>

<div><br></div><div>As you can see I am using linux-yocto kernel version 3.=
0.4.=A0So can you please shed some light on this issue.</div><div><br></div=
><div>Thanks,</div><div>JC</div><div><br></div><div>PS: This is my first po=
st on OE mailing list. Please direct me if I went wrong somewhere.<br clear=
=3D"all">

<div><br></div><br>
</div></div>

--00504502caea1ddfc104ba2abfdb--
