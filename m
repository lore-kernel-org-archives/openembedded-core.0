Return-Path: <robert_joslyn@selinc.com>
Received: from scamp.selinc.com (scamp.selinc.com [74.117.214.142])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4036FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 19:53:09 +0000 (UTC)
Received: from pps.filterd (scamp.selinc.com [127.0.0.1])
	by scamp.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w1DJqiGp020395; 
	Tue, 13 Feb 2018 11:53:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=in-reply-to :
	references : to : cc : mime-version : subject : message-id : from :
	date : content-type; s=SELinc2017;
	bh=dFc+UHaYOYz00LRHskrUDZSEzNY4cFWIisX7dLHAVt4=;
	b=HdICV1WAAG88nO9blhkR2Unla3ciONQ+80Ha8gPbnd7Wmmf8ljFvs3H+qRXbsRaXl8WA
	IyfhX+V6Qla5UXiWOQnHcR7Pb4mXYrwNOu7gT+ECOzd87Re76w2rypVvkzWzROakTh7y
	ug9gTsqntJOChVv62QCTfSosF9HBFTGD9a9ykOPV0iLtoj1LBpIH09yxCJb3Q0L5ftEG
	TxGlOONhoa616p9DTvrkNQS1LnhSxa8b+ml8C+MA2L7K4M2dhCeaGaoWi//zch0rsqI2
	cTog5MNWQC0h8YJqBWPa6j22VZtuEME0XgLEVkOx3dljds2kENG5ToAWfQwh8xKZKDYR
	Xw== 
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by scamp.selinc.com with ESMTP id 2g1yk359sy-1;
	Tue, 13 Feb 2018 11:53:09 -0800
In-Reply-To: <00ccda06-5caf-0aad-9df8-df46a8b40a9f@gmail.com>
References: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
	<00ccda06-5caf-0aad-9df8-df46a8b40a9f@gmail.com>
To: akuster808 <akuster808@gmail.com>
MIME-Version: 1.0
X-KeepSent: 443B05FA:5DD35177-88258233:006CE535;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OF443B05FA.5DD35177-ON88258233.006CE535-88258233.006D3BA8@selinc.com>
From: robert_joslyn@selinc.com
Date: Tue, 13 Feb 2018 11:53:07 -0800
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/13/2018 11:53:06 AM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/13/2018 11:53:06 AM,
	Serialize complete at 02/13/2018 11:53:06 AM,
	S/MIME Sign failed at 02/13/2018 11:53:07 AM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/13/2018 11:53:10 AM,
	Serialize complete at 02/13/2018 11:53:10 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8804
	signatures=668670
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Backport OpenSSL 1.0.2n
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
X-List-Received-Date: Tue, 13 Feb 2018 19:53:09 -0000
Content-Type: text/plain; charset="US-ASCII"

akuster808 <akuster808@gmail.com> wrote on 02/13/2018 08:27:52 AM:
> On 02/12/2018 01:08 PM, robert_joslyn@selinc.com wrote:
> > I'm working with the pyro release, and noticed that it's still using 
> > openssl 1.0.2k. The latest version in the 1.0.2 series is 1.0.2n, 
which is 
> > already available on master. Is there a reason that the newer version 
> > hasn't made it back to pyro (or rocko, which is on 1.0.2m)? 
> openssl 1.1 was added and the openssl files got restructured making
> simple cherry-picking not an option for older releases.
> 
> 1.0.2n hit master 7 days ago, sorry for the delay.
> 
> 1.0.2n is now in stable/rocko-next and will migrate to rocko when
> appropriate.

Sorry, I didn't notice that it only reached master a week ago. If you've 
already taken care of rocko, I'll send a patch for pyro shortly.

Thanks,
Robert

