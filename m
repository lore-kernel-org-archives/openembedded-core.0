Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13A00783EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 23:28:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 70so2123922wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GczL+LKatx0lSI0O/m1Rh9ndJMruqtX0VKGrFH3zdbw=;
	b=fcqYliFtxY+7wDnX1LJMWmTc5gWPCWs5QkSChz1mTKbYtszeccnjglfjVIhnQEMRic
	+kJc76kSsjkjE4MyWZa6wo9paP7pGTPcUmFvogcf8B5GILeNd8I+Vh5Ytd5y3PGX/5fc
	3PDA+XqQCtse/+h6X26DfqIlpmZ1Gm2ZnzePJ7x8lBnPGSWg+V4lcweoWT9kDlym0EOE
	wjP0l8Vp3nfcJazHVoJaLtQE8A4HGnkcN3/wDYdzaHq1lCAM7OlgNIHEyjRGmmg9PJV2
	w/FGhWLtqBtET8woPZ8v4W9PQBseQUpATx1BAVn8oDyhzgJFLMVApXut0No+IlG4TGAs
	Y6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GczL+LKatx0lSI0O/m1Rh9ndJMruqtX0VKGrFH3zdbw=;
	b=KUYwfaMUIaiAf4VrTKatNrtyIFNq+QtISZml4y9AZp28dQMgFo7DsBhZF/4B6bUArk
	mdFzn+UH6jlV/pKg8hp0feNo0IV2NAFKua7EUTuUkaUjRyMCXW5SeQrYhZzosLPCQlDT
	r2PvkEPD9sMs9aQZWlS+MxsgFUjHqD6YU03HFDc0t5Nt2apAwfDD7ldHR6YTshcAKzga
	5zrGt0xAvCnDp33nzU+iTl+Iq6hBiQHbIoYoncrsSHdItKZIAjefuvt23c/n5+uZW0zd
	EsVqqsMPFhy0oN8Hfrt4tPNdC0wHinRhZ0N7k8su2Knac9Pd8D+6/3KygEda3qsxLtse
	GqBw==
X-Gm-Message-State: AKS2vOyDK/8Z3QCIhBPkitkiU1IhMqPPPLFLUWBKgB78sUXQaDrTvSSO
	OY9yyAHWJ9YOa8THnN38DtqL2O096A==
X-Received: by 10.80.154.129 with SMTP id p1mr5292437edb.131.1497569307416;
	Thu, 15 Jun 2017 16:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Thu, 15 Jun 2017 16:27:56 -0700 (PDT)
In-Reply-To: <db9dab56-437e-3568-94ef-dcffd637caee@linux.intel.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
	<1fcd2f1adf3506cc8d22cbbc538ffb7e1eebbf8f.1497453168.git.raj.khem@gmail.com>
	<225c958a-3bd3-b8b7-8447-53dc8a4d34ec@linux.intel.com>
	<CAMKF1sotA4FHmA3oinKzF95P2+aSr54JbbT4UdCMiATO9Zuj7w@mail.gmail.com>
	<db9dab56-437e-3568-94ef-dcffd637caee@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jun 2017 16:27:56 -0700
Message-ID: <CAMKF1spduTHP16Bx9trpkUbqnzpm_Hk96XNKSgm5aXGdaDaPRQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] gobject-introspection: Disable generating static lbraries
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
X-List-Received-Date: Thu, 15 Jun 2017 23:28:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 15, 2017 at 1:46 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/15/2017 07:02 PM, Khem Raj wrote:
>>
>> On Thu, Jun 15, 2017 at 2:50 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>>
>>> On 06/14/2017 06:23 PM, Khem Raj wrote:
>>>>
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>
>>>
>>>
>>> Why? You need to add an explanation to the commit message.
>>>
>> sure, its to avoid linking with .a when using pie
>
>
>
> Can you resend the patch please?

Updated on pull request branch
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/hardening-fixes&id=ea442af4b3a7669485a18d57fbb043d9093189bc

>
> Alex
>

