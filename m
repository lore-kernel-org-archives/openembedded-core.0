Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6400F60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 22:09:58 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id k23so93588835oih.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=k9tDZOVKdf6lX1Uh9k1Bmlazoj3Hlocu9pzgYrgoU2Q=;
	b=zU5vo62/JwqMEtswuT8nr3BoojV9gqEtJ2c1F6htqwaXLjW/qGn3K7qhhMRzJ2LxHr
	NYGyDpZrzUAq+72uT+rijEqJu8H6X0/G7bEGPze/tucdEqDsEe+U9FDSRLLVyytmaINb
	6AQwaSywJYP548UM0FY8Kb7U9Z0CjVsFgajcUrMVD6DxzfGJsB+OPmyv7Jfiy3Oqo4mC
	X9jldDw9ijld2kCfaMrutuiw7JRS0DgHBVRnsb4uxiWouE4+Dtxu8lxUWwSaLzePn3Ex
	BBWMI83X0DlRJ1IbsBXPrPvW/muW/P4Z+S9FtJE/GnvMOWdbMPpof0dHDDhUiuly6uwG
	Ya6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=k9tDZOVKdf6lX1Uh9k1Bmlazoj3Hlocu9pzgYrgoU2Q=;
	b=VlZDlE7/ecAQXuWU7venL943mKOXvLyILYqE8tgfP+GHHBCUllTHccULR2sdFhQ0G3
	qVv7ZZ/ErH73td6QU1GrOfMIThd9cyqpu6vTIYY8jUWYY2OELTk7fol13nmkex9NtWAs
	JsM/+ZeUs6fwg/xDn9Xe1nQlmc0ADFzTWNmWvMFPjnF+eGdoattXXevWlkyML7B9932k
	39GSHW6zyhW5mugPEsC/kNdNEYbRhQ0lG0lwIFhO7RJSkQ33TA7GoL/hw0sjKzwiSHT+
	yOmHfHSPAFYTsVGeQ76Zyh1Xwb0C52XdgQz8MXPa1PobdI6mwKpBWs3dtl3QDxtYlnuS
	RHWQ==
X-Gm-Message-State: AOPr4FUKJLSS/JpxZIYMf7eBt8XhfEgyhE3uBER6qA6cd1gAExnddooUhnTjMaab7YN8acwnto6RhUKYuwrKDg==
X-Received: by 10.202.104.91 with SMTP id d88mr9493930oic.75.1464041399512;
	Mon, 23 May 2016 15:09:59 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.98.137 with HTTP; Mon, 23 May 2016 15:09:30 -0700 (PDT)
In-Reply-To: <CAKmqyKPw2M0aso8Ti6aChzx_EBDMveOHwkzdiERy-qnQ4jn09w@mail.gmail.com>
References: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKPPRF+AvEShiFopGj-WtzM6Hdr48nBanA4TEwdWKq2ZSg@mail.gmail.com>
	<CAJTo0LYJuy3vJG_nDp_qA_YTRr62FgN5YUzYcWb5=i6WoAv2Ow@mail.gmail.com>
	<CAKmqyKPw2M0aso8Ti6aChzx_EBDMveOHwkzdiERy-qnQ4jn09w@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 23 May 2016 15:09:30 -0700
X-Google-Sender-Auth: SbJmcqwD0h81XNoyW6EPDrriw-w
Message-ID: <CAKmqyKPjFjtqhfLx8R=qJDR=_4mrL7ChdLUfOHeGEUofwYTdkA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] runqemu: Add suport for qemuzynqmp
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
X-List-Received-Date: Mon, 23 May 2016 22:09:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2016 at 2:37 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Sat, May 21, 2016 at 2:33 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 19 May 2016 at 17:40, Alistair Francis <alistair.francis@xilinx.com>
>> wrote:
>>>
>>> On Thu, May 12, 2016 at 2:37 PM, Alistair Francis
>>> <alistair.francis@xilinx.com> wrote:
>>> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>>
>>> Ping!
>>
>>
>> Sorry meant to reply to this a lot earlier.  There's a RFC from Robert Yang
>> which proposes a series of patches to completely rewrite how runqemu works,
>
> Are you talking about the 'runqemu/runqemu-internal: refactor it' patch series?
>
> I talked to him about that and I'm happy to help convert the Xilinx
> machines to the new method.
>
>> so the machine-specific knowledge is contained in the BSP itself.  As a BSP
>> maintainer who is working on runqemu, would you be able to have a look at
>> see if it should solve all of your needs?
>
> I haven't looked into it too much yet, but I can't see why it wouldn't
> work for us.
>
>>
>> (this is now marked for my staging branch too)

Just to double check, you mean this patch is in your staging branch right?

Thanks,

Alistair

>
> Thanks!
>
> Alistair
>
>>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

