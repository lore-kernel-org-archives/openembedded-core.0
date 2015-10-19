Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-09.smtp.antispamcloud.com (mx18-09.smtp.antispamcloud.com
	[207.244.64.178])
	by mail.openembedded.org (Postfix) with ESMTP id ABA2E77070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 05:27:23 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Zo2yW-0006nH-PU; Mon, 19 Oct 2015 07:27:22 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 19 Oct 2015 07:26:05 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <CABcZANkYQD8esrYrhDWZdiXnp5tEdemmh0cGyqpGWX_zA_t5fA@mail.gmail.com>
	<1445032208-31789-1-git-send-email-benjamin.esquivel@linux.intel.com>
Organization: TOPIC
Message-ID: <56247F26.1010101@topic.nl>
Date: Mon, 19 Oct 2015 07:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1445032208-31789-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw4+d5E37wd7o1HkJDyf5UJgKnuyzaS/cmRpVwk4+qL2rtor9O5jjWZI633McN2M/OXE3
	ie2fEgNaLigX0JpObEGlehOeAfYdyhyTMa7gCEns6WlD9TRTRSjp45Qp7A7wd1bzCq67oGaaQp35
	AX0gXQr6IR4JHNuJxZie0dx/UFeDFjoogi0vFJQWXg4O6p8LpYDuk2wNBCS4dqM0NEeB5GoVr07Q
	khfESMgjghWZcYg5KnQD5yP4iod0zP3b02lROAFukO7/r9y81QUH134HO748CVsONrMJuGzuoGnK
	TKcyoNshbF/KUKEpKW61c71tRxwszoH7PZviv3Nfb+Q7nealW8k8TUyYxtac0PdoGUlxKAlmn4QY
	0Xa5w5mR23/WmRAktAfdM4BRlvaMgKl1pR5Ko62cR8cecC4FoQIG+wPHW4NAR0qbrlxNRt9ZoMCf
	Loaxwst/uqc93irpHvE5pJHFxKFUTpe/fk9Isv7jEvHPG2eHru/BzfgwTimxhZy/nqRFksz9oTNS
	J34R8WBrzHYJXH0emWsynl/RRQxMKCTJmdySlZou9qHIGOZDEEo7O08NiLww23m0+4XK+2UBRQOg
	bPv/MXs+X3ouFp0yUXBJPJoDnYz0/WMjPkK4AQMZT11z/z4WnEoC8C13cWABWliitPxZ67GmYM/P
	PKaPNI6i6J1fhOzjF0b4LXcjJZ5lolfDHDDNVupRueMIh/2Y+haxPeJR0ex6whtGuHwFHt841piR
	uKsYtYIRodiaTgNGzt7eshoTCdEOUMvFAoAj8UE=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH V2] populate SDK: prepare calling of bb.utils for exceptions
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
X-List-Received-Date: Mon, 19 Oct 2015 05:27:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 16-10-15 23:50, Benjamin Esquivel wrote:
> bb.utils.remove, bb.utils.movefile and bb.utils.mkdirhier can throw
> exceptions that need handling and proper error messages
> more work is required for these methods to handle properly the
> exceptions that can be raised within the various OS calls they make
> but this is a start to at least not hide the errors in the requested
> operations
>
> [YOCTO#8213]
>
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> ---
...
> +    def movefile(self, sourcefile, destdir):
> +        try:
> +            # FIXME: this check of movefile's return code to None should=
 be
> +            # fixed within the function to use only exceptions to signal=
 when
> +            # something goes wrong
> +            if (bb.utils.movefile(sourcefile, destdir) =3D=3D None):
> +                raise OSError("moving %s to %s failed"
> +                        %(sourcefile, destdir))
> +        #FIXME: using umbrella exc catching because bb.utils method rais=
es it
> +        except Exception as e:
> +            bb.debug(1, "printing the stack trace\n %s" %traceback.forma=
t_exc())
> +            bb.error("unable to place %s in final SDK location" % source=
file)
> +
> +    def mkdirhier(self, dirpath):
> +        try:
> +            bb.utils.mkdirhier(dirpath)
> +        except OSError as e:
> +            bb.debug(1, "printing the stack trace\n %s" %traceback.forma=
t_exc())
> +            bb.fatal("cannot make dir for SDK: %s" % dirpath)
> +
> +    def remove(self, path, recurse=3DFalse):
> +        try:
> +            bb.utils.remove(path, recurse)
> +        #FIXME: using umbrella exc catching because bb.utils method rais=
es it
> +        except Exception as e:
> +            bb.debug(1, "printing the stack trace\n %s" %traceback.forma=
t_exc())
> +            bb.warn("cannot remove SDK dir: %s" % path)


All these methods have a "self" in their argument list, but don't use it. M=
ake=20
them static functions (inside or outside the class, that's your call. I'd p=
ut=20
them outside, they're totally unrelated).



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at : Aerospace Electrical Systems Expo Europe which will be held f=
rom 17.11.2015 till 19.11.2015, Findorffstra=EF=BF=BDe 101 Bremen, Germany,=
 Hall 5, stand number C65
http://www.aesexpo.eu



