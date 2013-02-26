Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UATbk-00063F-BT
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 00:06:49 +0100
Received: by mail-ie0-f177.google.com with SMTP id 16so5161612iea.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=RqY3pJ8xla0JQf/cER4kNnVcehY0o/6ukXfiC0UkXds=;
	b=k18uk/BithW5TMrlM4gZ7ixkcmihQu/5kvIvLYZdusH+Hq1DvCmW93bKnHd1AdX5H7
	hBNICxzufWLA3bdL7rlA9DEiewVCLg+hvcLGPawJhSPGOG/p0LHDjj1hA2Yh2idaHNbj
	woRREofTUGZlfh81BSBi71Fno0fYd1NhaTMPO9+wppY+t+Me487cUg/j+N+Thf1vG5ya
	if62KS/gkq5A5LHSMIxYSRpaW+uD5vmNRkCNiEo9ALJ/Gu5mk0N3y/rTOyZSAFjEPZ6g
	Q9PD7s3Uq5MWVzAyvrV9Tz3CAQLclRk982Grj2S9eN1Is6hpbk+qb0BcQO855BDKYTNI
	8pkg==
X-Received: by 10.50.153.198 with SMTP id vi6mr6328705igb.112.1361919028140;
	Tue, 26 Feb 2013 14:50:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Tue, 26 Feb 2013 14:49:55 -0800 (PST)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A89192C@039-SN1MPN1-001.039d.mgd.msft.net>
References: <CAMEF+f=FAyLCaWwjzq+W=1QEZcEM3V1awR8-e5ogFdn923ndhg@mail.gmail.com>
	<20130226175608.GB13278@sakrah.homelinux.org>
	<70CC66F5C30A414DADDA6973E4CA391A89192C@039-SN1MPN1-001.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2013 14:49:55 -0800
Message-ID: <CAMKF1soB0shnSBHyOz2WJdZsGLjaMKsd=H0pWdwCkT0ipQVdjA@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 26 Feb 2013 23:06:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 26, 2013 at 2:22 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Feb 26, 2013 at 11:56 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On (26/02/13 17:08), Anton Sergienko wrote:
>>> Hi!
>>> After the patch (commit c49f967384ccbfe131bbb33ee518014f3fc4b38f) to
>>> meta/classes/kernel-arch.bbclass kernel build fails for arm machine with
>>> hard floating point instruction set in CC (-mfloat-abi=hard).
>>> As I understand kernel should not be build with fpu specific floating point
>>> instructions(should not be any floating point operation at all), but CFLAGS
>>> from machine-tune are propagated to CC and it also include -mfloat-abi
>>> flag. Should not -mfloat-abi flag be filtered out in kernel-arch.bbclass ?
>>
>> yes. I think this patch is creating more issues than its solving. I will
>> think about decoupling KERNEL_CC from CC once again.


>
> I just resubmitted my patch for this... It decouples all the extra
> args while still keeping the ones specifically added.


thanks for doing it


