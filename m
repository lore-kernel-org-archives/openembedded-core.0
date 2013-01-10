Received: from mail-ia0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TtN5T-0006TS-M5
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 19:43:10 +0100
Received: by mail-ia0-f171.google.com with SMTP id q36so794000iaq.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 10:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Xn3ePVI3GrPSrcIaq57/bnGgA0H0rnUdySvWV64xRsE=;
	b=MW/T/J8PuftlPlsg9Jo4m9a/CH86whfC2FQnvmPREPhvTEyD1RPXDzkMZCKQR0TZqk
	IyR700tDuuoF0jNiV2H4GdfmLLh2QensakZaBx0eRLRF6u3/iZt1D8oauKZOpzT6K5uw
	uR9hbML12Wu2aH39HRiNb686OKrIqSTnaFp536vaK/H6xiIbaNf/BoIyr+x1mOKm4ktW
	PKuZtLyyqE5V/Zsn/3GbOgzu45mH9ZpQ5Hx5ppovtdPBu18+CLDYXodt1HyYtfe0CJKL
	r//zT92gdXoBqdAAyip7L/Jlg4X9PjFedNueZkp/SU1itd1rWdhwUnEMbTQqAvIITHoq
	5vig==
X-Received: by 10.50.184.199 with SMTP id ew7mr6791854igc.84.1357842453525;
	Thu, 10 Jan 2013 10:27:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Thu, 10 Jan 2013 10:27:03 -0800 (PST)
In-Reply-To: <50EE757E.5030006@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<CAMKF1sow_bbU84+EYXR0hU_pbFxeR50c1ueWYWGqUnr6Swdy6g@mail.gmail.com>
	<50EE757E.5030006@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jan 2013 10:27:03 -0800
Message-ID: <CAMKF1sqJ6X6-Pb_r4B+S3va4SB8PLmeaCShB-PbQtP+_JwPqCw@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Thu, 10 Jan 2013 18:43:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 10, 2013 at 12:02 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>
> On 01/09/2013 07:14 PM, Khem Raj wrote:
>>
>> On Tue, Jan 8, 2013 at 4:24 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>>>
>>> As Ross suggested I've done the following changes to the previous set:
>>> * added two patches (the first two) that address multiple init systems
>>> support,\
>>> as in shifting from default hardcoded sysvinit to something more generic
>>> while
>>> the default values still remains on sysvinit
>>> * moved automatic setting of PREFERRED_PROVIDER_udev into
>>> default_providers.inc
>>> * removed ahavi-systemd since all it provided was service files; now
>>> service files
>>> are pulled in by avahi-daemon
>>> * also rebased on master
>>>
>> btw. there has been more merges into meta-systemd in meta-openembedded
>> since these patches were created I cant accertain
>> that you picked those too but please redo this series so the history
>> is a bit better for tracking purposes.
>
> I've tried to get in sync with meta-openembedded until they upgraded systemd
> to v196.

hmm that would also explain the -lrt problem that Saul is seeing but I dont.

 I tried to upgrade but something changed in the latest version and
> dbus-daemon didn't start anymore and because of that a few other services
> depending on it. I spent some time debugging it but eventually I decided we
> should go with the previous version and address the update after we merge.
> More details about this at
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1625

but we have to fix it I think weather you merge it or not since I dont  expect
us to stay at 195 forever and especially when folks who use meta-systemd
are already using 196 we wont be able to discard meta-systemd.

>
> Radu


