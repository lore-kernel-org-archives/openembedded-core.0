Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S0Okq-0002j9-KP
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 03:50:01 +0100
Received: by qadz30 with SMTP id z30so7073104qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 18:41:39 -0800 (PST)
Received-SPF: pass (google.com: domain of kergoth@gmail.com designates
	10.229.77.85 as permitted sender) client-ip=10.229.77.85; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of kergoth@gmail.com
	designates 10.229.77.85 as permitted sender)
	smtp.mail=kergoth@gmail.com;
	dkim=pass header.i=kergoth@gmail.com
Received: from mr.google.com ([10.229.77.85])
	by 10.229.77.85 with SMTP id f21mr25049844qck.146.1329964899417
	(num_hops = 1); Wed, 22 Feb 2012 18:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=lJn4u8kSpwFUPy+Zksbolxqh2zgKYQLynnz0wPZczfU=;
	b=N5bp2NKL6lYwFEanl8Hi3FZ47142nAAC7mUBBjm9toSUN6wrI7/7qiCdtmsMo1yv1l
	89JdAVXzUi6vHiEI1KhLRFUFVkEPiFzwQ18eJ+27vpwuUGSW2kX/UpE2xraZoCo6+HCT
	0I0OqTXqLbfVyYnBnuID7Ojtl9tvw3tjRBOa4=
Received: by 10.229.77.85 with SMTP id f21mr21166024qck.146.1329964899289;
	Wed, 22 Feb 2012 18:41:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.224.145 with HTTP; Wed, 22 Feb 2012 18:41:19 -0800 (PST)
In-Reply-To: <4F45A34A.6010708@windriver.com>
References: <4F21BE12.3000008@linux.intel.com>
	<4F24F672.5090107@linux.intel.com>
	<4F38E8CB.6090101@windriver.com> <4F3A9118.8050806@linux.intel.com>
	<4F3BCE0C.10400@linux.intel.com> <4F3C59A8.209@windriver.com>
	<4F3EE848.80703@linux.intel.com> <4F41EAD7.3030009@windriver.com>
	<4F43CD0C.8050700@linux.intel.com> <4F45A34A.6010708@windriver.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 22 Feb 2012 19:41:19 -0700
Message-ID: <CABcZANkP2QOdEE7ZRtqFZiSuDF7r3TKqQuqy5Vuq0BD9oPbqYA@mail.gmail.com>
To: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Source Archiver Class
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
X-List-Received-Date: Thu, 23 Feb 2012 02:50:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 7:24 PM, Xiaofeng Yan
<xiaofeng.yan@windriver.com> wrote:
> On 2012=E5=B9=B402=E6=9C=8822=E6=97=A5 00:57, Saul Wold wrote:
>>
>> On 02/19/2012 10:40 PM, Xiaofeng Yan wrote:
>>>
>>> On 2012=E5=B9=B402=E6=9C=8818=E6=97=A5 07:52, Saul Wold wrote:
>>>>
>>>>
>
> Hi Saul,
>
> I have implemented the most functions but srpm functions. I will complete
> the left work(merge functions from sourcepkg, src_distribute =C2=A0to
> archiver.bbclass, implement srpm functions. )
>
>
>>>> Xiaofeng & Community:
>>>>
>>>> We had a chat with Chris Larson and Mark Hatle here at ELC.
>>>>
>>>> We focused this issue down to a fewer number of options that meet the
>>>> needs of the licenses. Please review this and let us know if there are
>>>> any issues or concerns.
>>>>
>>>>
>>> Hi Saul,
>>>
>>> I comment my understanding as follow:
>>>>
>>>> Best Practices:
>>>> - Archive during build, we do not support nor recommend post archiving
>>>> - Original tarball and patches w/ordering file (maybe comment the
>>>> series), grab non-patch files also.
>>>
>>> for example:
>>> file://a.patch
>>> file://b.config.in
>>> we also archive b.config.in.
>>
>>
>> Yes, correct.
>>
>>>> - Unless requesting configured sources, which will just be the
>>>> configured source tarball
>>>> - Grab temp as postfunc of do_package - latest logs via links & pid
>>>>
>>> That means logs package include all of logs in temp. for example.
>>> You has described a following function we will realize at the previous
>>> email.
>>> 3 - Original Source code & Patches & temp (scripts & logs)
>>>
>>> source codes and patches should be in the stage do_patch[postfunc] =3D =
"
>>> do_get_source"
>>> logs should be in the stage do_package[postfunc] =3D " do_get_logs"
>>> So logs file shouldn't be archived in do_patch[postfunc] =3D " do_get_l=
ogs"
>>> The logs in the stage of do_packge are more than do_patch.
>>>
>> Correct, you want to get the logs and scripts from temp when they are mo=
st
>> complete (after do_package not after do_patch).
>>
>> As mentioned below, you would use the variable SOURCE_ARCHIVE_LOG in the
>> do_package[postfunc] to determine if you need to archive the logs or not=
.
>>
>>
>>>> For sstate Builds (LATER):
>>>> - need to verify that fetch/patch/configure will get re-run for
>>>> archiving
>>>> - Add temp dir to sstate capture (without links)
>>>>
>>>> 3 Implementations classes
>>>> - Filter in oe/lib/license.py
>>>> - source_archive.bb
>>>> - archives tarballs to ${BP}/...
>>>> - reuse copyleft_compliance for patch handling
>>>> - srpm
>>>> - take output from above and create SRPM - (LATER)
>>>>
>>> We will do the archive work according the license . I will implement tw=
o
>>> functions, one is for left, the other for right.
>>
>> I am not sure what you mean by one is for left and the other is for righ=
t?
>>
>> Can you explain your thoughts here.
>
> I mean I need implement a function to select to archive the packages from
> copyright(no free)or copyleft(free).

This is the filtering to put in license.py, and which is implemented
in copyleft_compliance.bbclass. It should largely be a copy/paste from
there..
--=20
Christopher Larson


