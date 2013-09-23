Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E97E36007B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 11:39:17 +0000 (UTC)
Received: from [172.16.141.168] (172.16.141.168) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 23 Sep 2013 13:39:16 +0200
Message-ID: <5240285B.3050308@enea.com>
Date: Mon, 23 Sep 2013 13:39:07 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <524006B4.6080209@communistcode.co.uk>
	<CAJTo0LYvrg5Cj7jUf-6z09NdC+Si_Q68hB_ahHEGBHqaqVToRw@mail.gmail.com>
In-Reply-To: <CAJTo0LYvrg5Cj7jUf-6z09NdC+Si_Q68hB_ahHEGBHqaqVToRw@mail.gmail.com>
X-Originating-IP: [172.16.141.168]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: elfutils patch failure
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
X-List-Received-Date: Mon, 23 Sep 2013 11:39:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

+1, saw this error as well.
And an additional patch failure for libtool-native.

Br,
David

On 09/23/2013 11:35 AM, Burton, Ross wrote:
> On 23 September 2013 10:15, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> patching file configure
>> Hunk #1 FAILED at 598.
>> Hunk #2 FAILED at 612.
>> Hunk #3 FAILED at 725.
>> Hunk #4 FAILED at 1378.
>> Hunk #5 succeeded at 4079 with fuzz 1 (offset 162 lines).
>> Hunk #6 FAILED at 4077.
>> Hunk #7 succeeded at 4612 (offset 186 lines).
>> Hunk #8 FAILED at 5162.
>> Hunk #9 succeeded at 5530 with fuzz 1 (offset 205 lines).
>> 6 out of 9 hunks FAILED -- rejects in file configure
>
> Patching a generated file is never a good idea, fix this by deleting
> that file from the patch.  To be honest that patch appears to be
> changing *far* too much.
>
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

