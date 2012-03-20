Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S9xhF-0005er-QQ
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:57:49 +0100
Received: by ggcy3 with SMTP id y3so6056792ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=A+Cmg0XTZPyuZ9AIUgmNzOey6DP1eSaoM+LdeR+GhW0=;
	b=kg3YXN8BHo7vD6oeksfO5/kJITdtS+pgX6DoJs2y3u8yjIkGNRoUi0hF3uRWyrHZLr
	LjMpBtSIaGrFvvRkXF+ecpnWmBJ5MOziRqq7hGpSh8VzXWy9mLe0yHVGyR7b1RmIYZhB
	iuvQ4kuZZ0dc6uXg6jEt6lKcnDWezK0KBKtsoYi2ae7mc6zAaLQ3hqDeAJgcZI8+h9Ox
	PE3UiqmMUlipRQI4KUbA8unDicdhT4SyAZHR9xBovlIAidOf33yhRqiU0T/BmrYW8GW/
	IdjvitSMeCqsHpL9czrSGHs/L2LZfHzri8Qy+0EtOgFtmYelXdaOnHKgn2dU6whSKu75
	kbLw==
MIME-Version: 1.0
Received: by 10.236.153.70 with SMTP id e46mr15915970yhk.29.1332244137111;
	Tue, 20 Mar 2012 04:48:57 -0700 (PDT)
Received: by 10.236.37.131 with HTTP; Tue, 20 Mar 2012 04:48:57 -0700 (PDT)
In-Reply-To: <20120316085323.GB3855@jama.jama.net>
References: <cover.1331887433.git.dongxiao.xu@intel.com>
	<3d86bbc3fc0de1c9d0fe4903edf9f643446fde9c.1331887433.git.dongxiao.xu@intel.com>
	<20120316085323.GB3855@jama.jama.net>
Date: Tue, 20 Mar 2012 12:48:57 +0100
Message-ID: <CA+chaQe+g+c_nYbUAudxd+uZNmHmWxowyT6co25R3UNc6h0SfA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: Exclude some variables when calculating cache hash
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
X-List-Received-Date: Tue, 20 Mar 2012 11:57:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2012 at 9:53 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Mar 16, 2012 at 04:48:34PM +0800, Dongxiao Xu wrote:
>> Some variables are not needed when calculating cache's hash, this
>> commit removes them.
>>
>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>> ---
>> =C2=A0meta/conf/bitbake.conf | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 216da75..908adcd 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -738,7 +738,7 @@ BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME}=
"
>> =C2=A0# Setup our default hash policy
>> =C2=A0BB_SIGNATURE_HANDLER ?=3D "OEBasic"
>> =C2=A0BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPAT=
H DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL=
 TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HO=
ST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
>> -BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME"
>> +BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME SESSIO=
N_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUT=
H_SOCK"
>
> what about that XAUTHORITY I had?

Today it went in without XAUTHORITY and I cannot test it because of
issues with new motherboard..

Cheers,


