Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D07F71D79
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 19:11:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l201so766370wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V8+okhngvlJE52NDh/oDFfoC0qkKqNfNeYq/PiDLcHM=;
	b=TIsNLsFGJUk9Bs9NmgcZ4IPi99pCkAOCdSwfbThqdW2VSccY7VB0CS6a59t8vtiD05
	gHAnOOqFIqWQbJA3s5a0DdyJo8E5PWRrIOGMqN+CuhmzMndD+fOOO1V1WamRgQt04j99
	/aaQ4BhaxwNtPdLTsBLOAfWUKZ2Gqb1Pa3jtcM3UhuGBlDg/aEJIsyxy+Q3v3WVq8XCB
	35loUqZx3Cf7KxHbFnARzJ0fU7En/pk4eyZTzoh0lzQkquEdruJmLEzS4Zn6d0lUv6t4
	X1cgWGk7tZxwZIam8Ji3usgvI/9Z9216c2UnyuPgIp8rSsrT9fIexBxgZuGm+VwvKvol
	sq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V8+okhngvlJE52NDh/oDFfoC0qkKqNfNeYq/PiDLcHM=;
	b=gamkauV0uoq/3DVq7i7D4ZWgAZUAUwPPTD+CSMSn988vf2F+Wk3/PHVu/YU1D5wDHr
	kmeOIRxHxMoTot7f9evxA6CSnD9/YszhlQSgiNGyQfMN7JqmxHsi/oC64r2N+wMh4ZeC
	MmS6wHhETugcXBVDfWB66WoNxyAF8m3vv4DVJETjj9pQzHjXi5X4Lcj95Q8dg7acIh8T
	2bWD4/pcvXDcOSMqyE6UGoBLzpOQMwoPFFJL+wAaPSMOLHiC85H61580JS9MzqSI83KL
	2yqoH1O5Iq8xXfHpXT8oBphQY8fCX0FQ/UzMjnEUtg61Ql5rtD3VvRww8lKaogRIL80D
	O7qQ==
X-Gm-Message-State: AElRT7GW8ahjnnLXxKnZ4Qy7Cf6bf6BVQeGz8jfRbOvHgKkD37K1ARzN
	x9VyLf6B/z62jAoQz4zmqyA/mT36jAuxyFkmOIY=
X-Google-Smtp-Source: AIpwx4+molQzbRJ9dke8cw5cvUxff9zJUm7S1RTQGKn9bE+uo1eHg8pxBUBjztBuFzWkmbEVNCweC2NksPYrmfs3Tfk=
X-Received: by 10.28.170.205 with SMTP id t196mr401656wme.42.1522177883816;
	Tue, 27 Mar 2018 12:11:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Tue, 27 Mar 2018 12:11:22 -0700 (PDT)
In-Reply-To: <20180326234108.4b52c066@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
	<20180326234108.4b52c066@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 27 Mar 2018 12:11:22 -0700
Message-ID: <CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Tue, 27 Mar 2018 19:11:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 9:41 PM, Seebs <seebs@seebs.net> wrote:
>
>> The syscall manpage is from the kernel manpages, not glibc.
>
>>   http://man7.org/linux/man-pages/man2/syscall.2.html
>
> And yet! glibc is setting those registers in its code. Why? If that's a
> kernel thing and libc doesn't need to do it, why is libc doing it?

Of course libc syscall is setting those registers WITHIN it's code.
The job of the syscall() function is to translate from a C callable
API into a kernel syscall - so it must read arguments passed in from
the C caller (via the normal C function call rules, e.g. the first few
arguments passed via registers, the rest on the stack, etc) and use
them to setup a kernel syscall (via the kernel's syscall interface, ie
maximum of 6 arguments, all passed via registers). After the kernel
syscall has returned, the implementation of libc syscall() needs to
collect the result from whichever register the kernel leaves it in and
return it via the normal C function call rules (plus take care of some
extra housekeeping, ie setting errno).

Whatever happens within syscall() is not important. The key point is
that it's a C callable function and follows standard C function call
rules.

> Okay, you've read the code in glibc and understand it. So, why does the
> glibc code have that register-setting assembly, if that register-setting
> assembly doesn't matter?

If you are asking why does glibc implement syscall() in assembler when
it could be implemented in completely generic C code (as musl does)
then the answer is I don't know. Historical I guess.

Looking at the glibc 32bit ARM syscall() assembler. After stripping
away the cfi_XXX annotations (ie stuff related to debug, not actual
opcodes) the assembler is:

ENTRY (syscall)
    mov    ip, sp
    push    {r4, r5, r6, r7}
    mov    r7, r0
    mov    r0, r1
    mov    r1, r2
    mov    r2, r3
    ldmfd    ip, {r3, r4, r5, r6}
    swi    0x0
    pop    {r4, r5, r6, r7}
    cmn    r0, #4096
    it    cc
    RETINSTR(cc, lr)
    b    PLTJMP(syscall_error)
PSEUDO_END (syscall)

ie it's pushing the original contents of r4, r5, r6 and r7 to the
stack, shuffling the first 4 arguments from C into the kernel's
syscall registers (the syscall number in r0 -> r7, the first argument
in r1 -> r0, etc), loading the next 4 arguments from C into registers
(cunningly, it loads 4 arguments directly from the stack into the
registers used for the next 4 arguments for the kernel syscall).
Interestingly, it's taking a total of 8 arguments from the C caller -
the first is the syscall number, then 7 additional arguments (one more
than required if the maximum is 6). It then invokes the syscall,
restores the callers original r4, r5, r6 and r7 values from the stack
and returns via a helper to set errno if the result from the kernel
indicated an error.

Now, looking at the C code implementation of syscall() in musl:

long syscall(long n, ...)
{
    va_list ap;
    syscall_arg_t a,b,c,d,e,f;
    va_start(ap, n);
    a=va_arg(ap, syscall_arg_t);
    b=va_arg(ap, syscall_arg_t);
    c=va_arg(ap, syscall_arg_t);
    d=va_arg(ap, syscall_arg_t);
    e=va_arg(ap, syscall_arg_t);
    f=va_arg(ap, syscall_arg_t);
    va_end(ap);
    return __syscall_ret(__syscall(n,a,b,c,d,e,f));
}

It fetches 6 va_args arguments from the caller, using standard C
function calling rules, and passes them on to the architecture
specific __syscall() macro, which will put the arguments in the
registers used for the kernel syscall and then invoke the syscall.
Note that since this is pure generic C code, you can insert debug,
call other functions etc where ever you like (the only thing that
needs special attention is that __syscall_ret() set errno).

Compiling the musl C code for 32bit ARM gives the following assembler:

00000000 <syscall>:
   0:    e92d000f     push    {r0, r1, r2, r3}
   4:    e92d48b0     push    {r4, r5, r7, fp, lr}
   8:    e28db010     add    fp, sp, #16
   c:    e28b0008     add    r0, fp, #8
  10:    e24dd00c     sub    sp, sp, #12
  14:    e28bc008     add    ip, fp, #8
  18:    e59b7004     ldr    r7, [fp, #4]
  1c:    e50bc018     str    ip, [fp, #-24]    ; 0xffffffe8
  20:    e890000f     ldm    r0, {r0, r1, r2, r3}
  24:    e59b4018     ldr    r4, [fp, #24]
  28:    e59b501c     ldr    r5, [fp, #28]
  2c:    ef000000     svc    0x00000000
  30:    ebfffffe     bl    0 <__syscall_ret>
  34:    e24bd010     sub    sp, fp, #16
  38:    e8bd48b0     pop    {r4, r5, r7, fp, lr}
  3c:    e28dd010     add    sp, sp, #16
  40:    e12fff1e     bx    lr

Although this is a bit of a mess (gcc obviously isn't good at
optimising va_args as it needlessly saves the first 4 arguments to the
stack and then loads them back again...) the basic shuffling of
arguments from a C function call into the registers used for the
kernel syscall is the same as the glibc assembler! (Apart from the
fact it only handles 6 syscall arguments, not 7 as the glibc assembler
does, so nothing is setup in r6).

ie the glibc assembler isn't some mysterious function with a non
standard calling convention - it's just an optimised implementation of
a standard C function.

> Okay, you say you understand why ARM EABI "sometimes" needs an argument
> to offset things. What are the circumstances?

The background to this is that in ARM 32bit EABI, 64bit values in
registers need to be kept in an even/odd register pair, which then
allows "double word" load and store instructions (ie single
instructions, first added in ARMv5, which can load or store 64bit
values from an even/odd register pair) to be used to read and write
them to/from memory. Since the ARM 32bit EABI kernel syscall interface
uses registers r0,r1,r2,r3, etc to pass the syscall arguments, a
padding argument is required if the first word of a 64bit value passed
to the kernel would not naturally be placed into an even numbered
register. In the readahead example, the first syscall argument is the
32bit file descriptor (which will be passed to the kernel in r0),
therefore a padding argument is required to fill r1 and ensure that
the first word of the 64bit offset gets passed in r2.

> Is it specific to 32-bit
> targets?

The above is completely specific to ARM 32bit EABI. I guess *similar*
issues may apply to some other 32bit architectures (as suggested in
the manpage). It's certainly not an issue with is generic to all 32bit
targets though.

> On a target with 64-bit pointers, would it apply also to
> 64-bit pointers, or is it exclusively for 64-bit integers?

Since 64bit architectures can, by definition, read and write 64bit
values to memory using single load and store instructions, no 64bit
architecture would have an ABI which places a restriction that 64bit
values need to be held in any particular register - so no padding
arguments would ever be required to accommodate that.

> Because it seems to me that on a 64-bit target, renameat2() would in
> fact be passing a 64-bit object as the second argument. And if there's
> a reason that this doesn't count as a 64-bit argument passed after an
> odd number of 32-bit arguments, I'd like to know specifically what that
> reason is before I go relying on it to stay true forever.

For a 64bit architecture, the distinction between a 32bit argument and
a 64bit argument is only in how you interpret that data. In all cases
the data is passed as a 64bit value.

The code calling libc syscall() and the code within the kernel which
interprets the syscall arguments must agree on the format of the data,
but for a libc syscall() implementation which just passes the
arguments along it can treat everything as 64bit values. It doesn't
matter if an argument is actually int, long, or pointer. See the musl
syscall() implementation - all va_args values are extracted from the
caller as long.

If syscall(), or a wrapper for it, *does* need to interpret the
arguments for a particular syscall then the syscall() implementation
would have to also agree with the interpretation of the data defined
by the kernel.

