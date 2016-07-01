Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9017660111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:45:27 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id a125so206274631qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l3lck4q1EW6wjIUX5jsyXMAeUJ3P84f6dBi3MceuRYg=;
	b=gb0yE0csQ2v2M4mzvAD5ZfWRNzu7da3tPoFrlbKb3Y0TAK4+zl1bTFwFYAR+IrDcvD
	hGY8xs8kUhxh7aRCaxDHjC5W2wtSbgA6DF+FjmJ41kcGeG8Bm10PRHsRmz2m9/ei3kcp
	DxkL5AVf8Yae3oxEubVLZkZW57Y4vFvBDGyKyjuJC3PJDOEKX3v4FgkzORxZ+Hr+u/jG
	kc2S6cWEObzNVEbxoWfz3xkpQBU2pzSEe8TqNPNBvyozB4Y2dg4UJlLDaQu7ARFvTCvi
	CYMBBdHSaDJfbmLJTtp/QBLrGc3datIShHFUjlqh6sL62j2WcNL8Lp1RVZEl7tSHK6Pv
	T+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l3lck4q1EW6wjIUX5jsyXMAeUJ3P84f6dBi3MceuRYg=;
	b=DguxIxQVcd3jMoq8MlTfLx/IlAgLmv3BM0sujjr0pBP1BPXbqxQnaCO41RCVXTU1vp
	2bL0Cav5dkvEbZzOrWMHsHs/Cf+4nQBredWzwV9nQMXa14yFSXlgDwafxFbfsBCb2JFN
	LGH4ZO+QJSdH2bcdSBS4gWhb0T0t0mmjlrVCMzMVwj4zDF5yCHvEkJobiX8lMur3DWxw
	oE5InXPQl4RJcDARdLrbjviH1ERKB04WVjndvbUfSRh7MIx1Qp87wNO7JwyFTa2/46JF
	vFqyYRh5Ty8vwTNUV4AV6LpLzCopTUUTKi5ZSVBBfSb37VKeNpsqTxDrOohfggT2oZ8A
	m6IQ==
X-Gm-Message-State: ALyK8tIhSgjH2x5ZCtZXC2BotQRYKdIPxvH5y3ePEcp7TuRus+qpJgrwCh7wJqe3Vjbg1Aj90v+hqFmDec9T+g==
X-Received: by 10.55.16.232 with SMTP id 101mr29163861qkq.151.1467384327921;
	Fri, 01 Jul 2016 07:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 07:44:58 -0700 (PDT)
In-Reply-To: <a4af0a4c-f6f2-a46d-2a0c-97220b0c3dc4@linuxfoundation.org>
References: <ae4e2654-ca20-85d1-d53b-b0b05ab25a26@linuxfoundation.org>
	<CAMKF1srZ=NCMop1BWgZ9PACGJEjVguDngZT4tcAt0jqnBZt_rA@mail.gmail.com>
	<a4af0a4c-f6f2-a46d-2a0c-97220b0c3dc4@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 07:44:58 -0700
Message-ID: <CAMKF1spQNoo2J58FiMHk6kVPfzOz9Q9_6Ad9yqiqKCp0A2Wc7w@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Patchwork upgrade tonight
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
X-List-Received-Date: Fri, 01 Jul 2016 14:45:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 12:37 AM, Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
> The new patchwork is in place at https://patchwork.openembedded.org/.
> The performance changes appear to be working well. Please e-mail if you
> notice any problems.

Thanks for doing this. I think i would like to call for volunteers to
review and close OE-Core pending patches which have been merged. it
would be good to keep this list relevant like meta-openembedded is.

>
> On 06/30/2016 04:11 PM, Khem Raj wrote:
>> On Thu, Jun 30, 2016 at 4:03 PM, Michael Halstead
>> <mhalstead@linuxfoundation.org> wrote:
>>> Please reach out if you have concerns.
>>
>> Hi Mike
>>
>> I have been playing with the new instance no issues so far. Send a
>> note when you bring down the system and again another when its all up.
>>
> There should have been no down time. Both systems remain running and the
> cut over was done with a DNS change.
>
> --
> Michael Halstead
> Linux Foundation / SysAdmin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

